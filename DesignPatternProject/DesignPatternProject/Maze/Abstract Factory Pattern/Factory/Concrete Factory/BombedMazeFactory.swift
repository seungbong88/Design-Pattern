//
//  BombedMazeFactory.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/10.
//

import Foundation

// Concrete Factory
class BombedMazeFactory: MazeFactory {
  override func makeWall() -> Wall {
    return BombedWall()
  }
  
  override func makeRoom(num: Int) -> Room {
    return BombedRoom(roomNumber: num)
  }
}
