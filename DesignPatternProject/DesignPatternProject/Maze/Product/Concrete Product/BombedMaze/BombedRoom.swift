//
//  BombedRoom.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/10.
//

import Foundation

// Concrete Product
class BombedRoom: Room {
  override func enter() {
    print("방 \(roomNumber) 에 들어왔습니다.")
    
    if roomNumber%2 == 1 {
      print("방에 폭탄이 있습니다.")
    }
  }
}
