//
//  DarkSwitch.swift
//  FactoryPattern
//
//  Created by seungbong on 2021/09/01.
//

import UIKit

class DarkSwitch: UISwitch {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .black
    self.tintColor = .white
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
