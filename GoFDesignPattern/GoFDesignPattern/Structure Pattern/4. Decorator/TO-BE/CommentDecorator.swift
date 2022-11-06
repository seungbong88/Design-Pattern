//
//  CommentDecorator.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

// 3. Decorator
class CommentDecorator: CommentService {
    var commentService: CommentService
    
    init(service: CommentService) {
        self.commentService = service
    }
    
    func addComment(_ comment: String) {
        commentService.addComment(comment)
    }
    
    func printConmments() {
        commentService.printConmments()
    }
}
