//
//  NetworkManager.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 23.02.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://raw.githubusercontent.com/deryacayiroglu/h5190004deryacayiroglu/main/"
    
    private init() {}
    
    func getWomenInScience(completed: @escaping (Result<[Woman], ErrorMessage>) -> Void) {
        let endpoint = baseURL + "BilimKadinlariApi.json"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableTocomplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let womenInScience = try decoder.decode([Woman].self, from: data)
                completed(.success(womenInScience))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
