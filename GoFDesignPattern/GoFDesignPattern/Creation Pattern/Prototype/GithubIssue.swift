//
//  GithubIssue.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/11.
//

import Foundation

class GithubIssue {
    var id: Int
    var repository: GithubRepository
    
    init(id: Int, repository: GithubRepository) {
        self.id = id
        self.repository = repository
    }
    
    func getUrl() -> String {
        return "https://github.com/\(repository.user)/\(repository.title)/\(id)"
    }
    
    // 깊은 복사
    func cloneWithShallowCopy() -> GithubIssue {
        return GithubIssue(id: self.id, repository: self.repository)
    }
     
    // 얕은 복사
    func cloneWithDeepCopy() -> GithubIssue {
        let repository = GithubRepository()
        repository.title = self.repository.title
        repository.user = self.repository.user
        return GithubIssue(id: self.id, repository: repository)
    }
}
