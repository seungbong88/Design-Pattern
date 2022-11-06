//
//  SpamFilteringCommentDecorator.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/01.
//

import Foundation

// 4. ConcreteDecorator
class SpamFilteringCommentDecorator: CommentDecorator {
    
    override func addComment(_ comment: String) {
        if !comment.contains("http") {
            commentService.addComment(comment)
        }
    }
}
