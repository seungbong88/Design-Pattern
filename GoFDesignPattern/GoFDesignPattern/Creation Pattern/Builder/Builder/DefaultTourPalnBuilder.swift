//
//  DefaultTourPalnBuilder.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/10.
//

import Foundation

class DefaultTourPalnBuilder: TourPlanBuilder {
    
    var title: String = ""
    var schedules: [String] = []
    var stayName: String?
    var days: Int?
    var nights: Int?
    
    func setTitle(_ title: String) -> TourPlanBuilder {
        self.title = title
        return self
    }
    
    func setNightsAndDays(nights: Int, days: Int) -> TourPlanBuilder {
        self.nights = nights
        self.days = days
        return self
    }
    
    func whreToStay(_ name: String) -> TourPlanBuilder {
        self.stayName = name
        return self
    }
    
    func addSchedules(_ schedule: String) -> TourPlanBuilder {
        schedules.append(schedule)
        return self
    }
    
    func getPlan() -> TourPlan? {
        guard let stayName = self.stayName,
              let nights = self.nights,
              let days = self.days else { return nil }
        
        return TourPlan(title: title, stayName: stayName, nights: nights, days: days, schedules: schedules)
    }   
}
