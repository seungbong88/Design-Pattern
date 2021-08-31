//
//  LightSwitch.swift
//  FactoryPattern
//
//  Created by seungbong on 2021/09/01.
//

import UIKit

class LightSwitch: UISwitch {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .white
    self.tintColor = .black
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
