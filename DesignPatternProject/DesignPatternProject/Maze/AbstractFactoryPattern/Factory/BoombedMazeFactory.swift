//
//  BombedMazeFactory.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/10.
//

import Foundation

// Concrete Factory
class BoombedMazeFactory: MazeFactory {
  override func makeWall() -> Wall {
    return BoombedWall()
  }
  
  override func makeRoom(num: Int) -> Room {
    return RoomWithBoomb(roomNumber: num)
  }
}
