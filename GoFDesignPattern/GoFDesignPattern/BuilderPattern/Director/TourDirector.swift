//
//  TourDirector.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/10.
//

import Foundation

class TourDirector {
    func createDefaultTour() -> TourPlan? {
        return DefaultTourPalnBuilder()
            .setTitle("코타키나발루 여행")
            .setNightsAndDays(nights: 4, days: 6)
            .whreToStay("LUMA Hotel")
            .getPlan()
    }
}
