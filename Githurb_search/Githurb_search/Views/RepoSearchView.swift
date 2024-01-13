//
//  RepoSearchView.swift
//  Githurb_search
//
//  Created by 이민호 on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct RepoSearchView: View {
    let store: StoreOf<RepoSearch>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    HStack {
                        TextField(
                            "Search repo",
                            text: Binding(
                                get: { viewStore.keyword },
                                set: {
                                    viewStore.send(.keywordChange($0))
                                }
                            )
                        )
                            .textFieldStyle(.roundedBorder)
                        
                        Button {
                            viewStore.send(.search)
                        } label: {
                            Text("search")
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    List {
                        ForEach(viewStore.searchResult, id: \.self) { repo in
                            Text(repo)
                        }
                    }
                }
                .navigationTitle("Githurb Search")
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    RepoSearchView(
        store: Store(initialState: RepoSearch.State()) {
            RepoSearch()
        }
    )
}
