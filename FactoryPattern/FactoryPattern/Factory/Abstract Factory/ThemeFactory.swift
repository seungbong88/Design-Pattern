//
//  ThemeFactory.swift
//  FactoryPattern
//
//  Created by seungbong on 2021/08/31.
//

import UIKit

enum ComponentType {
  case uiButton
  case uiSwitch
}

// MARK:- Abstract Factory
protocol ComponentFactory {
  func createComponent(type: ComponentType, isEnabled: Bool) -> UIControl
}

// MARK:- Concrete Factory
final class LightThemeFactory: ComponentFactory {
  func createComponent(type: ComponentType, isEnabled: Bool) -> UIControl {
    switch type {
    case .uiButton:
      let button = LightButton()
      button.isEnabled = isEnabled
      return button
    case .uiSwitch:
      let switchh = LightSwitch()
      switchh.isEnabled = isEnabled
      return switchh
    }
  }
}

final class DarkThemeFactory: ComponentFactory {
  func createComponent(type: ComponentType, isEnabled: Bool) -> UIControl {
    switch type {
    case .uiButton:
      let button = DarkButton()
      button.isEnabled = isEnabled
      return button
    case .uiSwitch:
      let switchh = DarkSwitch()
      switchh.isEnabled = isEnabled
      return switchh
    }
  }
}
