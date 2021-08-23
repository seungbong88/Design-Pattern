//
//  EnchantedRoom.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/24.
//

import Foundation

class EnchantedRoom: Room {
  override func enter() {
    if roomNumber % 3 == 0 {
      print("방에 들어왔습니다.")
    } else if roomNumber % 3 == 1{
      print("스피드 증가 효과를 얻습니다.")
    } else {
      print("독에 걸렸습니다.")
    }
  }
}
