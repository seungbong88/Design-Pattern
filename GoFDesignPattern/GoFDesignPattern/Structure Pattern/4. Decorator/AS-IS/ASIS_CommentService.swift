//
//  CommentService.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/06.
//

import Foundation

class ASIS_CommentService {
    private var comments: [String] = []
    
    func addComment(_ comment: String) {
        comments.append(comment)
    }
     
    func printConmments() {
        for comment in comments {
            print(comment)
        }
    }
}
