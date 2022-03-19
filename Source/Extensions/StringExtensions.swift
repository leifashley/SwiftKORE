//
//  Extensions.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/18/22.
//

import Foundation

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "localized")
    }
    
    public var asURLRequest: URLRequest? {
        if let url = URL(string: self) {
            return URLRequest(url: url)
        } else {
            return nil
        }
    }
    
//    public func localized2() -> String {
//        return NSLocalizedString(self, comment: "localized")
//    }
//    
//    public func asURLRequest2() -> URLRequest? {
//        if let url = URL(string: self) {
//            return URLRequest(url: url)
//        } else {
//            return nil
//        }
//    }
}

