//
//  ViewController.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        let settings = Settings3.getInstance
        let settings2 = Settings3.getInstance
        print(settings === settings2)
        
        super.viewDidLoad()
    }
}

