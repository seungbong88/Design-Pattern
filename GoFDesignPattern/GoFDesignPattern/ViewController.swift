//
//  ViewController.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        singletonTest()
    }
    
    private func singletonTest() {
        print(Settings.getInstance === Settings.getInstance)
        print(Settings2.getInstance === Settings2.getInstance)
        print(Settings3.getInstance === Settings3.getInstance)
        print(Settings4.getInstance === Settings4.getInstance)
        print(Settings5.getInstance === Settings5.getInstance)
    }
}

