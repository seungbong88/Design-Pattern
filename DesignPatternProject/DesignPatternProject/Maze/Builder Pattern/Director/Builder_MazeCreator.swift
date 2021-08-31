//
//  MazeGame.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/24.
//

import Foundation

// Dicrector
class Builder_MazeCreator {
  func createGame(builder: MazeBuilder) -> Maze {
    builder.buildMaze()
    builder.buildRoom()
    builder.buildWall()
    
    return builder.getMaze()
  }
}
