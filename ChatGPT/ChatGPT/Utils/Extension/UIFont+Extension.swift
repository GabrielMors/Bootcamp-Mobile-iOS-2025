//
//  UIFont+Extension.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 28/05/25.
//

import UIKit

extension UIFont {
    
    static func helveticaNeueMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "helveticaNeueMedium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
