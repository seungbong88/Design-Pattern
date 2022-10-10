//
//  Setting.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/10.
//

import Foundation

// 1
class Settings {
    
    static var instance: Settings?
    
    static var getInstance: Settings {
        if instance == nil {
            instance = Settings()
        }
        
        return instance!
    }
    
    private init() { }
}

// 2. Eager Initialization
class Settings2 {
    
    static var instance = Settings2()
    
    static var getInstance: Settings2 {
        return instance
    }
    
    private init() { }
}

// 3. Synchronized Initialization
class Settings3 {
    
    static var instance: Settings3?
    
    static var getInstance: Settings3 {
        sync(lock: self) {
            if instance == nil {
                instance = Settings3()
            }
        }
        return instance!
    }
    
    private init() { }

    static func sync(lock: Any, closure: ()->Void) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock)
    }
}

// 4. Doublc Checked Locking
class Settings4 {
    
    static var instance: Settings4?
    
    static var getInstance: Settings4 {
        if instance == nil {
            sync(lock: self) {
                if instance == nil {
                    instance = Settings4()
                }
            }
        }
        
        return instance!
    }
    
    private init() { }

    static func sync(lock: Any, closure: ()->Void) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock)
    }
}

// 5. Static Inner Class
class Settings5 {
    
    private class SettingsHolder {
        static var instance = Settings5()
    }
    
    static var getInstance: Settings5 {
        return SettingsHolder.instance
    }
    
    private init() { }
}
