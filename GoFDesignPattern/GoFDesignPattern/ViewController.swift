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
        self.view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        commandTest()
    }
    
    private func singletonTest() {
        print(Settings.getInstance === Settings.getInstance)
        print(Settings2.getInstance === Settings2.getInstance)
        print(Settings3.getInstance === Settings3.getInstance)
        print(Settings4.getInstance === Settings4.getInstance)
        print(Settings5.getInstance === Settings5.getInstance)
    }
    
    private func prototypeTest() {
        let client = PrototypeClient()
        client.createIssue()
    }
    
    private func adapterTest() {
        let adaptorApp = AdapterApp()
        adaptorApp.start()
    }
    
    private func bridgeTest() {
        let bridgeApp = BridgeApp()
        bridgeApp.start()
    }
    
    @objc private func decorateTest() {
        let decoratorApp = DecoratorApp()
        decoratorApp.customExcerciseStart()
    }
    
    private func flyweightTest() {
        let flyweightApp = FlyWeightApp()
        flyweightApp.start()
    }
    
    private func commandTest() {
        let commandApp = CommandApp()
        commandApp.start()
    }
}
