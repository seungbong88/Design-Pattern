//
//  CommentService.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

// 1. Component
protocol CommentService {
    func addComment(_ comment: String)
    func printConmments()
}
