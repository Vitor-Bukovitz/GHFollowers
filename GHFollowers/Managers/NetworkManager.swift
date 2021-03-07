//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Vitor Bukovitz on 3/6/21.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    let baseUrl = "https://api.github.com/users/"
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?)  -> Void) {
        let endpoint = baseUrl +  "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            return completed(nil, "This username created an invalid request. Please try again.")
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                return completed (nil, "Unable to complete your request. Please check your internet connection.")
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completed(nil, "Invalid response from the server. Please try again.")
            }
            
            guard let data = data else {
                return completed(nil, "The data received from the server is invalid. Please try again.")
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data received from the server is invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}
