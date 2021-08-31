//
//  ViewController.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/06.
//

import UIKit

class ViewController: UIViewController {

  enum DesignPattern {
    case abstractFactory  // 추상팩토리 패턴
    case builder          // 빌더 패턴
    case factoryMethod    // 팩토리 메서드 패턴
  }
  
  private var maze: Maze?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    createGame(with: .abstractFactory)
    createGame(with: .builder)
  }
  
  private func createGame(with designPattern: DesignPattern) {
    switch designPattern {
    case .abstractFactory:
      gameWithAbstractFactoryPattern()
    case .builder:
      gameWithBuilderPattern()
    case .factoryMethod:
      gameWithFactoryMethodPattern()
    }
  }
  
  // MARK:- Game with Design Pattern
  
  private func gameWithAbstractFactoryPattern() {
    // 폭탄 미로 게임 생성
    let factory = BombedMazeFactory()
    let gameManager = AF_MazeCreator()
    maze = gameManager.createGame(factory: factory)
  }
  
  private func gameWithBuilderPattern() {
    // 마법 미로 게임 생성
    let builder = EnchantedMazeBuilder()
    let director = Builder_MazeCreator()
    maze = director.createGame(builder: builder)
  }
  
  private func gameWithFactoryMethodPattern() {
    // 하드코어 미로 게임 생성
    let creator = HardcoreMazeCreator()
    maze = creator.createMaze()
  }
}

