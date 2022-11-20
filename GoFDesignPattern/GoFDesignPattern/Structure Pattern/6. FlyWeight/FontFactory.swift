//
//  FontFactory.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/20.
//

import UIKit

class FontFactory {
    private var cache: [String: UIFont] = [:]
    
    func getFont(name: String, size: CGFloat) -> UIFont {
        if cache[name] == nil {
            cache[name] = UIFont(name: name, size: size)
        }
        return cache[name]!
    }
}
