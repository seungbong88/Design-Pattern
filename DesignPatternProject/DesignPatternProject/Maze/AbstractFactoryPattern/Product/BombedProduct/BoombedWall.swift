//
//  BoomedWall.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/10.
//

import Foundation

// Concrete Product
class BoombedWall: Wall {
  override func enter() {
    print("폭탄이 터졌습니다. 사망하였습니다.")
  }
}
