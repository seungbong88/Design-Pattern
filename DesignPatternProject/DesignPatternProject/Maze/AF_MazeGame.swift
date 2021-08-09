//
//  AF_MazeGame.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/07.
//

import Foundation

/// 추상팩토리 패턴을 이용한 미로 게임
class AF_MazeGame {
  
  func startGame() {
    // 일반 미로 게임 생성
    let maze = createGame(factory: MazeFactory())
    
    // 폭탄 미로 게임 생성
    let boomedMaze = createGame(factory: BoombedMazeFactory())
  }
  
  // 방 두 개 짜리 맵을 생성
  private func createGame(factory: MazeFactory) -> Maze {
    let maze = factory.makeMaze()
    let r1 = factory.makeRoom(num: 1)
    let r2 = factory.makeRoom(num: 2)
    let door = factory.makeDoor(room1: r1, room2: r2)
    
    maze.addRoom(room: r1)
    maze.addRoom(room: r2)
    
    r1.setSide(direction: .east, site: door)
    r2.setSide(direction: .west, site: door)
    
    return maze
  }
}
