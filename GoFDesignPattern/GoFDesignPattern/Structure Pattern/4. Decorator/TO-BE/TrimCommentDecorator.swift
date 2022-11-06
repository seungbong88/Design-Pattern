//
//  TrimCommentDecorator.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/01.
//

import Foundation

// 4. ConcreteDecorator
class TrimCommentDecorator: CommentDecorator {
    
    override func addComment(_ comment: String) {
        let trimmedComment = comment.replacingOccurrences(of: "...", with: "")
        commentService.addComment(trimmedComment)
    }
}
