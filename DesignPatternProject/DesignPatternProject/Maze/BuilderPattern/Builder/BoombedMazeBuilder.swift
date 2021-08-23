//
//  BoombedMazeBuilder.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/23.
//

import Foundation

final class BoombedMazeBuilder: MazeBuilder {
  var currentMaze: Maze?
  
  func buildMaze() {
    currentMaze = Maze()
  }
  
  func buildRoom() {
    currentMaze?.addRoom(room: BoombedRoom(roomNumber: 1))
    currentMaze?.addRoom(room: BoombedRoom(roomNumber: 2))
  }
  
  func buildWall() {
    guard let maze = currentMaze else { return }
    
    if maze.rooms.count > 0 {
      let targetRoom = maze.rooms.first!
      targetRoom.setSide(direction: .east, site: BoombedWall())
    }
  }
  
  func getMaze() -> Maze {
    return currentMaze!
  }
}
