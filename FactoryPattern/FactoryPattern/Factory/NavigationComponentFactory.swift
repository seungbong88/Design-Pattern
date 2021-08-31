//
//  NavigationComponentFactory.swift
//  FactoryPattern
//
//  Created by seungbong on 2021/08/31.
//

import UIKit

class ComponentFactory {
  enum ComponentType {
    case uiButton
    case uiSwitch
    case uiDatePicker
  }
  
  func createComponent(type: ComponentType, isEnabled: Bool) -> UIControl {
    switch type {
    case .uiButton:
      let button = UIButton()
      button.isEnabled = isEnabled
      return button
    case .uiSwitch:
      let switchh = UISwitch()
      switchh.isEnabled = isEnabled
      return switchh
    case .uiDatePicker:
      let datePicker = UIDatePicker()
      datePicker.isEnabled = isEnabled
      return datePicker
    }
  }
}
