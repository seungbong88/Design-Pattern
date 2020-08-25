//
//  Person.swift
//  MVC_Excercise
//
//  Created by seungbong on 2020/08/25.
//  Copyright © 2020 한승희. All rights reserved.
//

import Foundation

class Person {
    
    var name: String = ""
    var age: Int = 0
    
    func changeName(newName: String) {
        self.name = newName
    }
}
