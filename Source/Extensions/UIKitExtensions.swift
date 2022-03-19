//
//  UIKitExtensions.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/18/22.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(width: CGFloat = 0, height: CGFloat = 2, opacity: Float = 1, color: UIColor = UIColor.black.withAlphaComponent(0.1)) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: width, height: height)
    }
    
}

struct UIColorValues {
    var red : CGFloat = 0
    var green : CGFloat = 0
    var blue : CGFloat = 0
    var alpha: CGFloat = 0
    
    init(color: UIColor) {
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }
}

extension UIColor {
    convenience init(hexColorCode code: UInt) {
        let red   = CGFloat((code & 0xFF0000) >> 16)
        let green = CGFloat((code & 0xFF00) >> 8)
        let blue  = CGFloat(code & 0xFF)
        
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    }
    
    convenience init(hexString: String) {
        var code = hexString
        
        if code.hasPrefix("#") {
            code = String(code.dropFirst())
        }
        
        let color = UInt(code, radix: 16) ?? 0
        self.init(hexColorCode: color)
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

extension UIImageView {
    func addSolidColor(color: UIColor){
        image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }
}

extension UIFont {    
    class func notoSansRegular(size: CGFloat) -> UIFont {
        UIFont(name: "NotoSans-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    class func notoSansMedium(size: CGFloat) -> UIFont {
        UIFont(name: "NotoSans-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    class func notoSansSemibold(size: CGFloat) -> UIFont {
        UIFont(name: "NotoSans-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }
}
