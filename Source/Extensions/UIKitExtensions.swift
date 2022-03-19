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
