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
    
    func getWomenInScience(completed: @escaping ([Woman]?, String?) -> Void) {
        let endpoint = baseURL + "BilimKadinlariApi.json"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "Invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let womenInScience = try decoder.decode([Woman].self, from: data)
                completed(womenInScience,nil)
            } catch {
                completed(nil, "The data received from the server was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}
