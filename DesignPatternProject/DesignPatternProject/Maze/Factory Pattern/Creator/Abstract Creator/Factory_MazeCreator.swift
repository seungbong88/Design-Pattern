//
//  Factory_MazeCreator.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/28.
//

import Foundation

class Factory_MazeCreator {
  
  enum MazeType {
    case Bombed
    case Enchanted
    case Hardcore
  }
  
  func createMaze() -> Maze {
    let maze = makeMaze()
    let room1 = makeRoom(roomNumber: 1)
    let room2 = makeRoom(roomNumber: 2)
    let wall = makeWall()
    let door = makeDoor(leftRoom: room1, rightRoom: room2)
    
    maze.addRoom(room: room1)
    maze.addRoom(room: room2)
    room1.setSide(direction: .east, site: room2)
    room1.setSide(direction: .west, site: wall)
    room2.setSide(direction: .east, site: door)
    
    return maze
  }
  
  // MARK:- Factory Method
  private func makeMaze() -> Maze {
    return Maze()
  }
  private func makeRoom(roomNumber: Int) -> Room {
    return Room(roomNumber: roomNumber)
  }
  private func makeWall() -> Wall {
    return Wall()
  }
  private func makeDoor(leftRoom: Room, rightRoom: Room) -> Door {
    return Door(room1: leftRoom, room2: rightRoom)
  }
}
