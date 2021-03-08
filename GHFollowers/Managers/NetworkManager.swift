//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Vitor Bukovitz on 3/6/21.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    let cache = NSCache<NSString, UIImage>()

    private let baseUrl = "https://api.github.com/users/"
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>)  -> Void) {
        let endpoint = baseUrl +  "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            return completed(.failure(.invalidUsername))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                return completed (.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completed(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completed(.failure(.invalidData))
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
