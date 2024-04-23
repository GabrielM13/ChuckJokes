//
//  JokesManager.swift
//  ChuckJokes
//
//  Created by Gabriel Marinho da Silva on 30/10/20.
//

import Foundation

class JokesManager {
    
    private let urlString = "https://api.chucknorris.io/jokes/random?category=%@"
    
    func fetchData(category: String, completion: @escaping (Joke?, String?) -> Void) {
        
        let urlString = String(format: self.urlString, category)
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                completion(nil, "Error: \(error)")
                return
            }
            
            guard let safeData = data else {
                completion(nil, "No receive data.")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Joke.self, from: safeData)
                completion(decodedData, nil)
            } catch {
                completion(nil, "Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
