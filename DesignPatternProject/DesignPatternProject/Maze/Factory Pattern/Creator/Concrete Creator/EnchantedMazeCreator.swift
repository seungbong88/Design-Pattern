//
//  EnchantedMazeCreator.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/28.
//

import Foundation

final class EnchantedMazeCreator: Factory_MazeCreator {
  override func makeRoom(roomNumber: Int) -> Room {
    return EnchantedRoom(roomNumber: roomNumber)
  }
  
  override func makeWall() -> Wall {
    return EnchantedWall()
  }
  
  override func makeDoor(leftRoom: Room, rightRoom: Room) -> Door {
    return EnchantedDoor(room1: leftRoom, room2: rightRoom)
  }
}
