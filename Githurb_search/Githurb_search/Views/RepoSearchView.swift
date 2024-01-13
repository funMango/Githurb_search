//
//  RepoSearchView.swift
//  Githurb_search
//
//  Created by 이민호 on 1/13/24.
//

import SwiftUI

struct RepoSearchView: View {
    @State private var keyword: String = ""
    @State private var searchResult = [String]()
    
    private let sampleRepoList = [
        "Swift",
        "SwiftJson",
        "SwaftCollection",
        "SwiftSFsymbol",
        "SwiftData",
        "CoreData",
    ]
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search repo", text: $keyword)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        
                    } label: {
                        Text("search")
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
                List {
                    ForEach(sampleRepoList, id: \.self) { repo in
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

#Preview {
    RepoSearchView()
}
