//
//  ASIS_TrimFilteringCommentService.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/06.
//

import Foundation

class ASIS_TrimmingAndSpamFilteringCommentService: ASIS_CommentService {
    override func addComment(_ comment: String) {
        if !comment.contains("http") {
            let trimmedComment = comment.replacingOccurrences(of: "...", with: "")
            comments.append(trimmedComment)
        }
    }
}
