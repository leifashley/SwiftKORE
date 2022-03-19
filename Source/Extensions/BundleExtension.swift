//
//  BundleExtension.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/18/22.
//

import Foundation

extension Bundle {
    /// Loads a static resource from the main bundle and inflates the JSON to the given type
    /// - Returns: Type object or nil if no data was found
    func loadJson<T>(type: T.Type, resourceName: String) -> T? where T: Decodable {
        var result: T? = nil
        
        if let path = Bundle.main.path(forResource: resourceName, ofType: "json"), let data = FileManager.default.contents(atPath: path) {
            log.verbose("Path: \(path)")
            
            let decoder = JSONDecoder()
            
            do {
                result = try decoder.decode(T.self, from: data)
            } catch {
                log.error("Static JSON decode error for '\(resourceName)'", error: error)
            }
        } else {
            log.error("FATAL: cannot find json resource '\(resourceName)'", error: AppError.unknownError)
        }
        
        return result
    }
    
    
    /// Loads a static plist XML file and inflates the XML to the given type
    /// - Returns: Type object or nil if no data was found
    static func decodeFromPList<T>(_ type: T.Type, forResource: String) -> T? where T: Decodable {
        let logTitle = "Bundle.decodeFromPList"
        var t: T? = nil
        
        if let path = Bundle.main.path(forResource: forResource, ofType: "plist") {
            log.verbose("\(logTitle) Path: \(path)")
            
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    let decoded = try PropertyListDecoder().decode(type, from: data)
                    t = decoded
                } catch {
                    log.error("\(logTitle)", error: error)
                }
            }
            
        }
        
        return t
    }
}

extension Bundle {
    
    
    // returns the canonical appliocation name - this is the name default name of the app if CFBundleDisplayName is not set
    var appName:  String? {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String?
    }
    
    // returns the canonical application name - this is the name default name of the app if CFDisplayName is not specified
    var displayName: String? {
        return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String?
    }
    
    // returns the application bundle name - e.g., com.myorg.thisAppBundleName
    var bundleName: String? {
        return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String?
    }
    
    
    // returns the build number - this is not your applications version number but the internal build number
    // that should be incremented with every iTunesConnect submission
    var buildNumber: String? {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as? String  // was: CFBuildNumber
    }
    
    
    // returns the version number - known as the marketing version number
    var vesionNumber: String? {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String?
    }
    
    // returns the version number - known as the marketing version number
    var buildDate: Date? {
        return Bundle.main.infoDictionary!["CFBuildDate"] as! Date?
    }
    
    
}
