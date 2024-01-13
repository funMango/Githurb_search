//
//  ContentView.swift
//  Githurb_search
//
//  Created by 이민호 on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    var body: some View {
        RepoSearchView(
            store: Store(initialState: RepoSearch.State()) {
                RepoSearch()
            }
        )
    }
}

#Preview {
    ContentView()
}
