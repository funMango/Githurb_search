//
//  RepoSearch.swift
//  Githurb_search
//
//  Created by 이민호 on 1/13/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RepoSearch {
    private let sampleRepoList = [
        "Swift",
        "SwiftJson",
        "SwaftCollection",
        "SwiftSFsymbol",
        "SwiftData",
        "CoreData",
    ]
    
    struct State: Equatable {
        var keyword = ""
        var searchResult = [String]()
    }
    enum Action {
        case keywordChange(String)
        case search
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .keywordChange(keyword):
            state.keyword = keyword
            return .none
            
        case .search:
            state.searchResult = self.sampleRepoList.filter {
                $0.contains(state.keyword)
            }
            return .none
        }
    }
}
