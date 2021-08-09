//
//  Wall.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/06.
//

import Foundation

// Abstract Product
public class Wall: MapSite {
  func enter() {
    print("벽 입니다. 들어갈 수 없습니다.")
  }
}
