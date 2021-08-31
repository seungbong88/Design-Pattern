//
//  Singleton.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/09/01.
//

import Foundation

class Singleton {
  
  var instance: Singleton?
  
  var shared: Singleton {
    if instance == nil {
      instance = Singleton()
    }
    return instance!
  }
}
