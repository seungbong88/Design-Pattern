//
//  ASIS_TrimmingCommentService.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/06.
//

import Foundation

class ASIS_TrimmingCommentService: ASIS_CommentService {
    override func addComment(_ comment: String) {
        let trimmedComment = comment.replacingOccurrences(of: "...", with: "")
        comments.append(trimmedComment)
    }
}
