//
//  ViewController.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/06.
//

import UIKit

class ViewController: UIViewController {

  enum DesignPattern {
    case abstractFactory
    case builder
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
    }
  }
  
  // MARK:- Game with Design Pattern
  
  private func gameWithAbstractFactoryPattern() {
    // 폭탄 미로 게임 생성
    let factory = BoombedMazeFactory()
    let gameManager = AF_MazeGame()
    maze = gameManager.createGame(factory: factory)
  }
  
  private func gameWithBuilderPattern() {
    // 마법 미로 게임 생성
    let builder = EnchantedMazeBuilder()
    let director = MazeCreator()
    maze = director.createGame(builder: builder)
  }
}

