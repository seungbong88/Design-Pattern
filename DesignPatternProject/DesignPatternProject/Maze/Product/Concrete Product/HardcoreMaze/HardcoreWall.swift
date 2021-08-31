//
//  HardcoreWall.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/28.
//

import Foundation

final class HardcoreWall: Wall {
  override func enter() {
    let randNum = Int.random(in: 0...10)
    if randNum > 5 {
      print("사망하였습니다.")
    }
  }
}
