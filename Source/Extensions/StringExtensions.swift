//
//  Extensions.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/18/22.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "localized")
    }
    
    var hexToUInt: UInt {
        return UInt(self, radix: 16) ?? 0
    }
    
    //TODO: useful?
    var asURLRequest: URLRequest? {
        if let url = URL(string: self) {
            return URLRequest(url: url)
        } else {
            return nil
        }
    }
    
    func isEmail() -> Bool {
            let regex = try? NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$", options: .caseInsensitive)
            return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
        }
}


// https://github.com/amayne/SwiftString
public extension String {

    ///  Finds the string between two bookend strings if it can be found.
    ///
    ///  - parameter left:  The left bookend
    ///  - parameter right: The right bookend
    ///
    ///  - returns: The string between the two bookends, or nil if the bookends cannot be found, the bookends are the same or appear contiguously.
//    func between(left: String, _ right: String) -> String? {
//        guard
//            let leftRange = rangeOfString(left), rightRange = rangeOfString(right, options: .BackwardsSearch)
//            where left != right && leftRange.endIndex != rightRange.startIndex
//            else { return nil }
//
//        return self[leftRange.endIndex...rightRange.startIndex.predecessor()]
//
//    }
    
    // https://gist.github.com/stevenschobert/540dd33e828461916c11
//    var camelCasedString: String {
//            let source = self
//            if contains(source, " ") {
//                let first = source.substringToIndex(advance(source.startIndex, 1))
//                let cammel = NSString(format: "%@", (source as NSString).capitalizedString.stringByReplacingOccurrencesOfString(" ", withString: "", options: nil, range: nil)) as String
//                let rest = dropFirst(cammel)
//                return "\(first)\(rest)"
//            } else {
//                let first = (source as NSString).lowercaseString.substringToIndex(advance(source.startIndex, 1))
//                let rest = dropFirst(source)
//                return "\(first)\(rest)"
//            }
//        }
//
//    func capitalize() -> String {
//        return capitalizedString
//    }
//
//    func contains(substring: String) -> Bool {
//        return rangeOfString(substring) != nil
//    }
    
//    func chompLeft(prefix: String) -> String {
//        if let prefixRange = rangeOfString(prefix) {
//            if prefixRange.endIndex >= endIndex {
//                return self[startIndex..<prefixRange.startIndex]
//            } else {
//                return self[prefixRange.endIndex..<endIndex]
//            }
//        }
//        return self
//    }
//
//    func chompRight(suffix: String) -> String {
//        if let suffixRange = rangeOfString(suffix, options: .BackwardsSearch) {
//            if suffixRange.endIndex >= endIndex {
//                return self[startIndex..<suffixRange.startIndex]
//            } else {
//                return self[suffixRange.endIndex..<endIndex]
//            }
//        }
//        return self
//    }
//
//    func collapseWhitespace() -> String {
//        let components = componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).filter { !$0.isEmpty }
//        return components.joinWithSeparator(" ")
//    }
//
//    func clean(with with: String, allOf: String...) -> String {
//        var string = self
//        for target in allOf {
//            string = string.stringByReplacingOccurrencesOfString(target, withString: with)
//        }
//        return string
//    }
    
    func endsWith(suffix: String) -> Bool {
        return hasSuffix(suffix)
    }
    
//    func ensureLeft(prefix: String) -> String {
//        if startsWith(prefix) {
//            return self
//        } else {
//            return "\(prefix)\(self)"
//        }
//    }
//
//    func ensureRight(suffix: String) -> String {
//        if endsWith(suffix) {
//            return self
//        } else {
//            return "\(self)\(suffix)"
//        }
//    }
    
//    func indexOf(substring: String) -> Int? {
//        if let range = rangeOfString(substring) {
//            return startIndex.distanceTo(range.startIndex)
//        }
//        return nil
//    }
//
//    func initials() -> String {
//        let words = self.componentsSeparatedByString(" ")
//        return words.reduce(""){$0 + $1[0...0]}
//    }
//
//    func initialsFirstAndLast() -> String {
//        let words = self.componentsSeparatedByString(" ")
//        return words.reduce("") { ($0 == "" ? "" : $0[0...0]) + $1[0...0]}
//    }
//
//    func isAlpha() -> Bool {
//        for chr in characters {
//            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
//                return false
//            }
//        }
//        return true
//    }
//
//    func isAlphaNumeric() -> Bool {
//        let alphaNumeric = NSCharacterSet.alphanumericCharacterSet()
//        return componentsSeparatedByCharactersInSet(alphaNumeric).joinWithSeparator("").length == 0
//    }
//
//    func isEmpty() -> Bool {
//        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).length == 0
//    }
//
//    func isNumeric() -> Bool {
//        if let _ = defaultNumberFormatter().numberFromString(self) {
//            return true
//        }
//        return false
//    }
//
//    func join<S: SequenceType>(elements: S) -> String {
//        return elements.map{String($0)}.joinWithSeparator(self)
//    }
//
//    func latinize() -> String {
//        return self.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
//    }
//
//    func lines() -> [String] {
//        return self.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
//    }
//
//    func pad(n: Int, _ string: String = " ") -> String {
//        return "".join([string.times(n), self, string.times(n)])
//    }
//
//    func padLeft(n: Int, _ string: String = " ") -> String {
//        return "".join([string.times(n), self])
//    }
//
//    func padRight(n: Int, _ string: String = " ") -> String {
//        return "".join([self, string.times(n)])
//    }
//
//    func slugify(withSeparator separator: Character = "-") -> String {
//        let slugCharacterSet = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\(separator)")
//        return latinize()
//            .lowercaseString
//            .componentsSeparatedByCharactersInSet(slugCharacterSet.invertedSet)
//            .filter { $0 != "" }
//            .joinWithSeparator(String(separator))
//    }
//
//    func split(separator: Character) -> [String] {
//        return characters.split{$0 == separator}.map(String.init)
//    }
//
//    func startsWith(prefix: String) -> Bool {
//        return hasPrefix(prefix)
//    }
//
//    func stripPunctuation() -> String {
//        return componentsSeparatedByCharactersInSet(.punctuationCharacterSet())
//            .joinWithSeparator("")
//            .componentsSeparatedByString(" ")
//            .filter { $0 != "" }
//            .joinWithSeparator(" ")
//    }
//
//    func times(n: Int) -> String {
//        return (0..<n).reduce("") { $0.0 + self }
//    }
//
//    func toFloat() -> Float? {
//        if let number = defaultNumberFormatter().numberFromString(self) {
//            return number.floatValue
//        }
//        return nil
//    }
//
//    func toInt() -> Int? {
//        if let number = defaultNumberFormatter().numberFromString(self) {
//            return number.integerValue
//        }
//        return nil
//    }
//
//    func toDouble(locale: NSLocale = NSLocale.systemLocale()) -> Double? {
//        let nf = localeNumberFormatter(locale)
//
//        if let number = nf.numberFromString(self) {
//            return number.doubleValue
//        }
//        return nil
//    }
//
//    func toBool() -> Bool? {
//        let trimmed = self.trimmed().lowercaseString
//        if trimmed == "true" || trimmed == "false" {
//            return (trimmed as NSString).boolValue
//        }
//        return nil
//    }
//
//    func toDate(format: String = "yyyy-MM-dd") -> NSDate? {
//        return dateFormatter(format).dateFromString(self)
//    }
//
//    func toDateTime(format: String = "yyyy-MM-dd HH:mm:ss") -> NSDate? {
//        return toDate(format)
//    }
//
//    func trimmedLeft() -> String {
//        if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet) {
//            return self[range.startIndex..<endIndex]
//        }
//        return self
//    }
//
//    func trimmedRight() -> String {
//        if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet, options: NSStringCompareOptions.BackwardsSearch) {
//            return self[startIndex..<range.endIndex]
//        }
//        return self
//    }
//
//    func trimmed() -> String {
//        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//    }
//
//    subscript(r: Range<Int>) -> String {
//        get {
//            let startIndex = self.startIndex.advancedBy(r.startIndex)
//            let endIndex = self.startIndex.advancedBy(r.endIndex - r.startIndex)
//            return self[startIndex..<endIndex]
//        }
//    }
    
    func substring(start: Int, length: Int) -> String {
        guard start <= self.count-1 else {
            return ""
        }
        
        var len = length
        if (start + len) >= self.count {
            len = self.count - start
        }
        
        let i1 = self.index(self.startIndex, offsetBy: start)
        let i2 = self.index(i1, offsetBy: len)
        
        return String(self[i1..<i2])
    }
    
    
    
//    subscript(i: Int) -> Character {
//        get {
//            let index = self.startIndex.advancedBy(i)
//            return self[index]
//        }
//    }
}

