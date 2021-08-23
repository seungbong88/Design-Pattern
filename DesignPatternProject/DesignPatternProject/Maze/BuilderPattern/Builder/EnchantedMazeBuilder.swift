//
//  EnchantedMazeBuilder.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/24.
//

import Foundation

final class EnchantedMazeBuilder: MazeBuilder {
  var currentMaze: Maze?
  
  func buildMaze() {
    currentMaze = Maze()
  }
  
  func buildRoom() {
    currentMaze?.addRoom(room: EnchantedRoom(roomNumber: 1))
    currentMaze?.addRoom(room: EnchantedRoom(roomNumber: 2))
    currentMaze?.addRoom(room: EnchantedRoom(roomNumber: 3))
  }
  
  func buildWall() {
    guard let maze = currentMaze else { return }
    
    if maze.rooms.count > 1 {
      let targetRoom = maze.rooms[1]
      targetRoom.setSide(direction: .east, site: EnchantedWall())
    }
  }
  
  func getMaze() -> Maze {
    return currentMaze!
  }
}
