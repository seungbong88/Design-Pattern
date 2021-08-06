//
//  Maze.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/06.
//

import Foundation

public class Maze {
  private var rooms: [Room] = []
  
  func addRoom(room: Room) {
    rooms.append(room)
  }
  
  // 해당 번호의 방 반환
  func room(roomNo: Int) -> Room? {
    for room in rooms {
      if room.roomNumber == roomNo {
        return room
      }
    }
    return nil
  }
}
