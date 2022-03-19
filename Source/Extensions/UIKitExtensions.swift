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
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: width, height: height)
    }
    
}

extension UIColor {
    convenience init(webColorCode code: UInt) {
        let red   = CGFloat((code & 0xFF0000) >> 16)
        let green = CGFloat((code & 0xFF00) >> 8)
        let blue  = CGFloat(code & 0xFF)
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    }
    
    convenience init(webColor: String) {
        var code = webColor
        if code.hasPrefix("#") {
            code = String(code.dropFirst())
        }
        let color = UInt(code, radix: 16) ?? 0
        self.init(webColorCode: color)
    }
    
    static func | (lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }
        
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .dark ? darkMode : lightMode
        }
    }
    
}

extension UIImageView {
    func addSolidColor(color: UIColor){
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}

extension UIFont {    
    class func notoSansRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSans-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    class func notoSansMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSans-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    class func notoSansSemibold(size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSans-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }
}
