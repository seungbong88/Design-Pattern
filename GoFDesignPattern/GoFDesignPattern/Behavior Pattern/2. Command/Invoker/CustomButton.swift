//
//  CustomButton.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/27.
//

import Foundation

// 1. Invoker
class CustomButton {
    private var command: Command
    
    init(command: Command) {
        self.command = command
    }
    
    func buttonDidTap() {
        command.execute()
    }
}
