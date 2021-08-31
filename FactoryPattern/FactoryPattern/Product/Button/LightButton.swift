//
//  LightButton.swift
//  FactoryPattern
//
//  Created by seungbong on 2021/09/01.
//

import UIKit

class LightButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .black
    self.setTitleColor(.white, for: .normal)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
