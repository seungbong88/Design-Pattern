//
//  Room.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/06.
//

import Foundation

public class Room: MapSite {
  private var sides: [MapSite] = Array(repeating: Wall(), count: 4)
  var roomNumber: Int
  
  init(roomNumber: Int) {
    self.roomNumber = roomNumber
  }
  
  // 들어가기
  func enter() {
    
  }
  
  // 방의 주변 값 설정하기
  func setSide(direction: Direction, site: MapSite) {
    sides[direction.rawValue] = site
  }
  
  // 방의 주변 값 반환하기
  func getSide(direction: Direction) -> MapSite? {
    return sides[direction.rawValue]
  }
}
