//
//  ViewController.swift
//  DesignPatternProject
//
//  Created by seungbong on 2021/08/06.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let gameManager = AF_MazeGame()
    gameManager.startGame()
  }
}

