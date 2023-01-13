//
//  ContentViewModel.swift
//  Module-Demo
//
//  Created by cleanmac on 13/01/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    /// An array to store the retrieved post data from the internet.
    @Published var postList: [Post] = []
    
    /// Getting the post data from the internet and reloads the table view to show the retrieved data.
    func getPostData() {
        Webservice.shared.getAllPosts(onSuccess: { [weak self] data in
            self?.postList = data
        }, onFailed: { error in
            // Handle the error here
            // For example: Show an alert, show a custom cell, etc.
        })
    }
}
