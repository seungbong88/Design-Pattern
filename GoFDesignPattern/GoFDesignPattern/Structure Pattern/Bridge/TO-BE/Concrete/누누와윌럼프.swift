//
//  누누와윌럼프.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

// 4. Concrete Implementor
class 누누와윌럼프: DefaultChampion {

    init(skin: Skin) {
        super.init(name: "누누와윌럼프", skin: skin)
        self.skillName = "누누와 윌럼프 특공대 출발!"
    }
}
