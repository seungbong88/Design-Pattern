//
//  HardcoreMazeCreator.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/28.
//

import Foundation

final class HardcoreMazeCreator: Factory_MazeCreator {
  override func makeRoom(roomNumber: Int) -> Room {
    return HardcoreRoom(roomNumber: roomNumber)
  }
  
  override func makeWall() -> Wall {
    return HardcoreWall()
  }
}
