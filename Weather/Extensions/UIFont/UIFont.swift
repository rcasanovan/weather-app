//
//  UIFont.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

extension UIFont {

    public class func proximaNovaBoldWithSize(size : CGFloat) -> UIFont? {
        return UIFont(name: "ProximaNova-Bold", size: size)
    }
    
    public class func proximaNovaLightWithSize(size : CGFloat) -> UIFont? {
        return UIFont(name: "ProximaNova-Light", size: size)
    }
    
    public class func proximaNovaRegularWithSize(size : CGFloat) -> UIFont? {
        return UIFont(name: "ProximaNova-Regular", size: size)
    }
    
    public class func proximaNovaSemiboldWithSize(size : CGFloat) -> UIFont? {
        return UIFont(name: "ProximaNova-Semibold", size: size)
    }
    
}
