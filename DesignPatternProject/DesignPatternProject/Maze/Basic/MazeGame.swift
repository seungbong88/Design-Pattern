//
//  MazeGame.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/06.
//

import Foundation

public class MazeGame {
  
  // 방 두 개 짜리 맵을 생성
  private func createGame() -> Maze {
    let maze = Maze()
    let r1 = Room(roomNumber: 1)
    let r2 = Room(roomNumber: 2)
    let door = Door(room1: r1, room2: r2)
    
    maze.addRoom(room: r1)
    maze.addRoom(room: r2)
    
    r1.setSide(direction: .east, site: door)
    r2.setSide(direction: .west, site: door)
    
    return maze
  }
}
