//
//  JokesViewModel.swift
//  ChuckJokes
//
//  Created by Gabriel Marinho da Silva on 30/10/20.
//

import Foundation

class JokesViewModel {
    
    private var service = JokesManager()
    
    func getJoke(category: String, completion: @escaping (Joke) -> Void) {
        
        service.fetchData(category: category) { joke, error in
            if let error = error {
                print(error)
                return
            }
            
            if let joke = joke {
                completion(joke)
            }
        }
    }
}
