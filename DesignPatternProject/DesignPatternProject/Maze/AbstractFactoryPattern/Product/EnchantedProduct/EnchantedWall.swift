//
//  EnchantedWall.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/24.
//

import Foundation

class EnchantedWall: Wall {
  override func enter() {
    print("벽입니다. 마법 효과로 통과할 수 있습니다.")
  }
}
