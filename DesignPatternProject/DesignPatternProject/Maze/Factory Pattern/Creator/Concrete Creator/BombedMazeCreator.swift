//
//  BombedMazeCreator.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/28.
//

import Foundation

final class BombedMazeGame: Factory_MazeCreator {
  override func makeRoom(roomNumber: Int) -> Room {
    return BombedRoom(roomNumber: roomNumber)
  }
  
  override func makeWall() -> Wall {
    return BombedWall()
  }
  
  override func makeDoor(leftRoom: Room, rightRoom: Room) -> Door {
    return BombedDoor(room1: leftRoom, room2: rightRoom)
  }
}
