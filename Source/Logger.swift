//
//  Logger.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/18/22.
//

import Foundation
import SwiftyBeaver

/// For application wide logging, this adapter logging class will accept a base logging adapter and use it for logging.
/// This keeps the app insulated against changes in the logging system.
public class AppLogger {
    public var separatorTitleMessage = " - "
    public var separatorError = ": "
    
    let logger: LogAdapter
    
    public init(adapter: LogAdapter) {
        self.logger = adapter
    }
    
    public func verbose(title: String? = nil, _ message: String) {
        logger.info(buildLogMessage(title, message: message))
    }
    
    public func debug(title: String? = nil, _ message: String) {
        logger.debug(buildLogMessage(title, message: message))
    }
    
    public func info(title: String? = nil, _ message: String) {
        logger.info(buildLogMessage(title, message: message))
    }
    
    public func warn(title: String? = nil, _ message: String) {
        logger.warn(buildLogMessage(title, message: message))
    }
    
    public func error(title: String? = nil, _ message: String, error: Error) {
        logger.error(buildErrorLogMessage(title, message: message, error: error))
    }
    
    public func toConsole(_ message: String) {
        print(message)
    }
    
    private func buildLogMessage(_ title: String? = nil, message: String) -> String {
        var result = ""
        if let title = title {
            result += "\(title)\(separatorTitleMessage)\(message)"
        } else {
            result = message
        }
        
        return result
    }
    
    private func buildErrorLogMessage(_ title: String? = nil, message: String, error: Error? = nil) -> String {
        var message = buildLogMessage(title, message: message)
        
        if let error = error {
            message += "\(separatorError)\(error)"
        }
        
        return message
    }
}

public protocol LogAdapter {
    func verbose(_ message: String)
    func debug(_ message: String)
    func info(_ message: String)
    func warn(_ message: String)
    func error(_ message: String)
}

public class SwiftyBeaverLogAdapter: LogAdapter {
    static let console = ConsoleDestination()
    var logger: SwiftyBeaver.Type
    
    public func verbose(_ message: String) {
        logger.info(message)
    }
    
    public func debug(_ message: String) {
        logger.debug(message)
    }
    
    public func info(_ message: String) {
        logger.info(message)
    }
    
    public func warn(_ message: String) {
        logger.warning(message)
    }
    
    public func error(_ message: String) {
        logger.error(message)
    }
    
    init() {
        logger = SwiftyBeaverLogAdapter.buildLogger()
    }
    
    static func buildLogger() -> SwiftyBeaver.Type {
        let log = SwiftyBeaver.self
        
        console.format = "$DHH:mm:ss$d $L $M"
        console.asynchronously = false
        console.minLevel = .verbose
        
        if !log.destinations.contains(console) {
            log.addDestination(console)
        }
        
        return log
    }
}

public func className<T: Any>(_ c: T.Type, function: String) -> String {
    return "\(String(describing: c)).\(function)"
}
