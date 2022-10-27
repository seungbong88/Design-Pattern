//
//  Tour.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/10.
//

import Foundation

class TourPlan {
    var title: String
    var stayName: String
    var nights: Int
    var days: Int
    var sechedules: [String]
    
    init(title: String, stayName: String = "", nights: Int = 0, days: Int = 0, schedules: [String]) {
        self.title = title
        self.stayName = stayName
        self.nights = nights
        self.days = days
        self.sechedules = schedules
    }
}
