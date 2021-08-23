//
//  MazeBuilder.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/23.
//

import Foundation

protocol MazeBuilder {
  var currentMaze: Maze? { get set }
  
  func buildMaze()
  func buildRoom()
  func buildWall()
  
  func getMaze() -> Maze
}
