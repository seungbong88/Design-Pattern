//
//  Client.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/11.
//

import Foundation

class PrototypeClient {
    
    func createIssue() {
        let repository = GithubRepository()
        repository.title = "GithubAPIProject"
        repository.user = "seungbong"
        
        let issue = GithubIssue(id: 0, repository: repository)
        let url = issue.getUrl()
        print(url)
        
        let deepClone = issue.cloneWithShallowCopy()
        print(issue.repository.user)
        deepClone.repository.user = "happy"
        print(issue.repository.user)
    }
}
