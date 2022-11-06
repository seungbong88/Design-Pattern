//
//  ASIS_SpamFilteringCommentService.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/06.
//

import Foundation

class ASIS_SpamFilteringCommentService: ASIS_CommentService {
    override func addComment(_ comment: String) {
        if !comment.contains("http") {
            comments.append(comment)
        }
    }
}
