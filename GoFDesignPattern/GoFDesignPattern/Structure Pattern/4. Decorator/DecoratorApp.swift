//
//  DecoratorApp.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

class DecoratorApp {
    
    var enabledTrimming: Bool = true
    var enabledSapmFilter: Bool = true
    
    func ASIS_start() {
        let trimmingService = ASIS_TrimmingCommentService()
        trimmingService.addComment("안녕하세요...")
        trimmingService.addComment("반갑습니다...")
        trimmingService.printConmments()
        
        let spamFilteringService = ASIS_SpamFilteringCommentService()
        spamFilteringService.addComment("ㄷH박주1식! 무족권. 먹습니다. 오픈채팅방 http://www.open.kakao.com/oedkL/wkldsdklfoeKKL134")
        spamFilteringService.printConmments()
        
        let trimAndFilteringCommentService = ASIS_TrimmingAndSpamFilteringCommentService()
        trimAndFilteringCommentService.addComment("안녕하세요...")
        trimAndFilteringCommentService.addComment("반갑습니다...")
        trimAndFilteringCommentService.addComment("[긴급] 우체국택배 주소지 오입력으로 확인바랍니다. http://bze.spam123.zzang/dsDW42sdfaDDS")
        trimAndFilteringCommentService.printConmments()
    }
    
    func start() {
        var commentService: CommentService = DefaultCommentService()
        
        if enabledTrimming {
            commentService = TrimCommentDecorator(service: commentService)
        }
        
        if enabledSapmFilter {
            commentService = SpamFilteringCommentDecorator(service: commentService)
        }
        
        commentService.addComment("시선으로부터")
        commentService.addComment("정세랑... 장편소설... ...")
        commentService.addComment("(주)A에셋 동학농민개미 집중! 삼성 관련 700% 확정주 받기! https://open.kakao.com/o/gNqcCYKe")
        commentService.printConmments()
    }
}
