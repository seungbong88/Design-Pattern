//
//  TourPlanBuilder.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/10.
//

import Foundation

protocol TourPlanBuilder {
    var title: String { get set }
    var schedules: [String] { get set }
    
    func setTitle(_ title: String) -> TourPlanBuilder
    func setNightsAndDays(nights: Int, days: Int) -> TourPlanBuilder
    func whreToStay(_ name: String) -> TourPlanBuilder
    func addSchedules(_ schedule: String) -> TourPlanBuilder
    func getPlan() -> TourPlan?
}
