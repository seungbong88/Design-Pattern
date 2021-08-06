//
//  Door.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/06.
//

import Foundation

/// 방과 방 사이에 존재하는 문 객체
public class Door: MapSite {
  private var room1: Room
  private var room2: Room
  private var isOpen: Bool = false

  init(room1: Room, room2: Room) {
    self.room1 = room1
    self.room2 = room2
  }
  
  func enter() {
    
  }
  
  func otherSideFrom(room: Room) -> Room {
    if room.roomNumber == room1.roomNumber {
      return room2
    } else {
      return room1
    }
  }
}
