//
//  UIColorExtentions.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/19/22.
//

import Foundation
import SwiftUI

struct UIColorValues {
    var red : CGFloat = 0
    var green : CGFloat = 0
    var blue : CGFloat = 0
    var alpha: CGFloat = 0
    
    var redInt: Int {
        return Int(red * 255)
    }
    
    var blueInt: Int {
        return Int(blue * 255)
    }
    
    var greenInt: Int {
        return Int(green * 255)
    }
    
    var alphaInt: Int {
        return Int(alpha * 255)
    }
    
    var redHex: String {
        return String.init(format: "%02x", redInt)
    }
    
    var greenHex: String {
        return String.init(format: "%02x", greenInt)
    }
    
    var blueHex: String {
        return String.init(format: "%02x", blueInt)
    }
    
    var alphaHex: String {
        return String.init(format: "%02x", alphaInt)
    }
    
    init(color: UIColor) {
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }
}

@available(iOS 14.0, *)
public extension Color {
    var hex: String { UIColor(self).hex }
    var hexWithAlpha: String {UIColor(self).hexWithAlpha }
    
    func hexDescription(_ includeAlpha: Bool = false) -> String {
        UIColor(self).hexDescription(includeAlpha)
    }
}

@available(iOS 13.0, *)
public extension Color {
    static let systemBlue: Color = Color(UIColor.systemBlue)
    static let systemGreen: Color = Color(UIColor.systemGreen)
    static let systemIndigo: Color = Color(UIColor.systemIndigo)
    static let systemOrange: Color = Color(UIColor.systemOrange)
    static let systemPink: Color = Color(UIColor.systemPink)
    static let systemPurple: Color = Color(UIColor.systemPurple)
    static let systemRed: Color = Color(UIColor.systemRed)
    static let systemTeal: Color = Color(UIColor.systemTeal)
    static let systemYellow: Color = Color(UIColor.systemYellow)
    static let systemGray: Color = Color(UIColor.systemGray)
    static let systemGray2: Color = Color(UIColor.systemGray2)
    static let systemGray3: Color = Color(UIColor.systemGray3)
    static let systemGray4: Color = Color(UIColor.systemGray4)
    static let systemGray5: Color = Color(UIColor.systemGray5)
    static let systemGray6: Color = Color(UIColor.systemGray6)
    static let systemFill: Color = Color(UIColor.systemFill)
    static let secondarySystemFill: Color = Color(UIColor.secondarySystemFill)
    static let tertiarySystemFill: Color = Color(UIColor.tertiarySystemFill)
    static let quaternarySystemFill: Color = Color(UIColor.quaternarySystemFill)
    static let systemBackground: Color = Color(UIColor.systemBackground)
    static let secondarySystemBackground: Color = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground: Color = Color(UIColor.tertiarySystemBackground)
    static let systemGroupedBackground: Color = Color(UIColor.systemGroupedBackground)
    static let secondarySystemGroupedBackground: Color = Color(UIColor.secondarySystemGroupedBackground)
    static let tertiarySystemGroupedBackground: Color = Color(UIColor.tertiarySystemGroupedBackground)
}

public extension UIColor {
    //    convenience init(hexColorCode code: UInt) {
    //        let red   = CGFloat((code & 0xFF0000) >> 16)
    //        let green = CGFloat((code & 0xFF00) >> 8)
    //        let blue  = CGFloat(code & 0xFF)
    //
    //        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    //    }
    //
    //    convenience init(hexString: String) {
    //        var code = hexString
    //
    //        if code.hasPrefix("#") {
    //            code = String(code.dropFirst())
    //        }
    //
    //        let color = UInt(code, radix: 16) ?? 0
    //        self.init(hexColorCode: color)
    //    }
    
    convenience init(hexColorCode code: UInt) {
        let red   = CGFloat((code & 0xFF0000) >> 16)
        let green = CGFloat((code & 0xFF00) >> 8)
        let blue  = CGFloat(code & 0xFF)
        
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    }
    
    //    convenience init(hexString: String) {
    //        var code = hexString
    //
    //        if code.hasPrefix("#") {
    //            code = String(code.dropFirst())
    //        }
    //
    //        let color = UInt(code, radix: 16) ?? 0
    //        self.init(hexColorCode: color)
    //    }
    
    convenience init(hexString: String) {
        var code = hexString
        
        if code.hasPrefix("#") {
            code = String(code.dropFirst())
        }
        
        if code.count == 6 || code.count == 8 {
            var values = [CGFloat]()
            
            for i in stride(from: 0, to: hexString.count, by: 2) {
                let s = hexString.substring(start: i, length: 2)
                values.append(CGFloat(s.hexToUInt) / 255.0)                
            }
            
            let alpha:CGFloat = values.count == 4 ? values[3] : 1.0
            self.init(red: values[0], green: values[1], blue: values[2], alpha: alpha)
        } else {
            self.init()
        }
    }
    
    
    var hex: String { hexDescription(false) }
    var hexWithAlpha: String { hexDescription(true) }
    
    fileprivate func hexDescription(_ includeAlpha: Bool = false) -> String {
        let value = UIColorValues(color: self)
        let colorString = value.redHex + value.greenHex + value.blueHex
        
        return includeAlpha ? colorString + value.alphaHex : colorString
    }
    
    static func | (lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }
        
        return UIColor { (traitCollection) -> UIColor in
            traitCollection.userInterfaceStyle == .dark ? darkMode : lightMode
        }
    }
    
    var red: CGFloat {
        let values = UIColorValues(color: self)
        return values.red
    }
    
    var green: CGFloat {
        let values = UIColorValues(color: self)
        return values.green
    }
    
    var blue: CGFloat {
        let values = UIColorValues(color: self)
        return values.blue
    }
    
    var alpha: CGFloat {
        let values = UIColorValues(color: self)
        return values.alpha
    }
}

@available(iOS 13.0, *)
public extension Color {
    static func randomRed() -> Color {
        Color(red: .random(in: 0...1), green: 0, blue: 0)
    }
    static func randomGreen() -> Color {
        Color(red: 0, green: .random(in: 0...1), blue: 0)
    }
    static func randomBlue() -> Color {
        Color(red: 0, green: 0, blue: .random(in: 0...1))
    }
    
    static func random() -> Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}

public extension UIColor {
    func colorByAdjustingSaturation(factor : CGFloat) -> UIColor{
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var alpha:CGFloat = 0
        
        // get the old HSB
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &alpha )
        // apply the new S
        let newColor = UIColor(hue: h, saturation: s * factor, brightness: b, alpha: alpha)
        
        return newColor
    }
    
    func colorByAdjustingBrightness(factor : CGFloat) -> UIColor{
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var alpha:CGFloat = 0
        
        // get the old HSB
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &alpha )
        // apply the new B
        let newColor = UIColor(hue: h, saturation: s, brightness: b * factor, alpha: alpha)
        
        return newColor
    }
    
    func colorByAdjustingHue(factor : CGFloat) -> UIColor{
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var alpha:CGFloat = 0
        
        // get the old HSB
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &alpha )
        // apply the new H
        let newColor = UIColor(hue: h * factor, saturation: s, brightness: b , alpha: alpha)
        
        return newColor
    }
}

