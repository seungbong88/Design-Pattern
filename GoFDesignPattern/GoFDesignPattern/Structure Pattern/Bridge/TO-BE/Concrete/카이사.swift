//
//  카이사.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

// 4. Concrete Implementor
class 카이사: DefaultChampion {
    
    init(skin: Skin) {
        super.init(name: "카이사", skin: skin)
    }
}
