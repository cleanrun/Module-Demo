//
//  ContentView.swift
//  Module-Demo
//
//  Created by cleanmac on 13/01/23.
//

import SwiftUI

struct ContentView: View {
    /// The view model instance for this view.
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        List {
            /// Looping the post list from the view model.
            ForEach(viewModel.postList, id: \.postId) { value in
                /// Show the id and the title from the model.
                VStack(alignment: .leading) {
                    Text("ID: \(value.postId)")
                    Text(value.title)
                }
            }
        }.onAppear {
            /// Retrieving the post data when the view appears.
            viewModel.getPostData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
