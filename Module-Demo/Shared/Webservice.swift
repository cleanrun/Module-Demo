//
//  Webservice.swift
//  Module-Demo
//
//  Created by cleanmac on 13/01/23.
//

import Foundation

/// An object to retrieve data from the internet.
class Webservice {
    /// The URL for retrieving the post data
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    /// The singleton instance for this webservice object
    static let shared = Webservice()
    
    /// This initializer should be private because this Webservice class should be instantiated as a singleton instance only.
    private init() {}
    
    /// Retrieving all the post from the URL
    /// - Parameters:
    ///   - onSuccess: Use this closure if the data is successfully retrieved. It will returns an Array of Posr model class
    ///   - onFailed: Use this closure if the data is not successfully retrieved. Could be an URL error, decoder error, etc.
    func getAllPosts(onSuccess: @escaping ([Post]) -> Void, onFailed: @escaping (Error) -> Void) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil, let data else {
                onFailed(error!)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    onSuccess(decodedData)
                }
            } catch {
                onFailed(error)
            }
        })
        
        task.resume()
    }
}
