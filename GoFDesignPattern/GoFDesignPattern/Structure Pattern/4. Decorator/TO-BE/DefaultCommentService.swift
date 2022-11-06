//
//  DefaultCommentService.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

// 2. Concrete Component
class DefaultCommentService: CommentService {

    var comments: [String] = []

    func addComment(_ comment: String) {
        self.comments.append(comment)
    }
    
    func printConmments() {
        for comment in comments {
            print(comment)
        }
    }
}
