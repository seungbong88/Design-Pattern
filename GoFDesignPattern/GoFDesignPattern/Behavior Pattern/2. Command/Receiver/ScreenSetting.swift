//
//  ScreenMode.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/27.
//

import Foundation

// 2. Receiver
class ScreenSetting {
    
    enum ScreenMode {
        case darkMode
        case whiteMode
    }
    
    private var screenMode: ScreenMode = .whiteMode
    
    func switchScreenMode() {
        if self.screenMode == .whiteMode {
            setDarkMode()
        } else {
            setWhiteMode()
        }
    }
    
    private func setDarkMode() {
        screenMode = .darkMode
        print("다크모드로 전환되었습니다.")
    }
    
    private func setWhiteMode() {
        screenMode = .whiteMode
        print("일반모드로 전환되었습니다.")
    }
}
