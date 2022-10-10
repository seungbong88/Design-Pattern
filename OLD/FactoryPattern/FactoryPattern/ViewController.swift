//
//  ViewController.swift
//  FactoryPattern
//
//  Created by seungbong on 2021/08/31.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func createCompWithoutFactory() {
    let comp1 = UIButton()
    let comp2 = UISwitch()
    let comp3 = UIDatePicker()
   
    comp1.isEnabled = true
    comp2.isEnabled = false
    comp3.isEnabled = true
  }
  
  func createCompWithFactory() {
    let factory = DarkThemeFactory()
    let myButton = factory.createComponent(type: .uiButton, isEnabled: true)
    let mySwitch = factory.createComponent(type: .uiSwitch, isEnabled: true)
  }
}

