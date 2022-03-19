//
//  DateExtension.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/18/22.
//

import Foundation

extension Date {
    static func iso8601Adaptive(_ decoder: Decoder) -> Date {
        let formats = [
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ss",
            "yyyy-MM-dd HH:mm:ss",
            "yyyy-M-d H:m:s"
        ]
        
        do {
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            let fmt = DateFormatter()
            
            for format in formats {
                fmt.dateFormat = format
                if let dt = fmt.date(from: dateStr) {
                    return dt
                }
            }
            
            log.error(title: "iso8601Adaptive", "could not formate date", error: AppError.unknownError)
        } catch {
            log.error(title: "iso8601Adaptive", "could not decode date", error: error)
        }
        
        return Date()
    }
    
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
    
    func ago() -> String {
        let interval = Date().timeIntervalSince(self)
        
        switch interval {
        case 0..<60:
            return "Just now"
        case 60..<120:
            return "A minute ago"
        case 120..<3600:
            return "\(String(format: "%.0f", interval / 60)) minutes ago"
        case 3600..<7200:
            return "An hour ago"
        case 7200..<86400:
            return "\(String(format: "%.0f", interval / 60 / 60)) hours ago"
        default:
            let days = Int(interval / 86400)
            let weeks = days / 7
            
            if weeks > 1 {
                return getFormattedDate(format: "dd/MM/yy HH:mm")
            } else if days > 1 {
                return "\(days) days ago"
            } else {
                return "Yesterday"
            }
        }
    }
}
