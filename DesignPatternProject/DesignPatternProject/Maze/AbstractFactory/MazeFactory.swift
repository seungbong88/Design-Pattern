//
//  MazeFactory.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/07.
//

import Foundation

class MazeFactory {
  func makeMaze() -> Maze {
    return Maze()
  }
  func makeRoom(num: Int) -> Room {
    return Room(roomNumber: num)
  }
  func makeWall() -> Wall {
    return Wall()
  }
  func makeDoor(room1: Room, room2: Room) -> Door {
    return Door(room1: room1, room2: room2)
  }
}
