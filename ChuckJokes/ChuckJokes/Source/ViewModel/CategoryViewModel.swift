//
//  CategoryViewModel.swift
//  ChuckJokes
//
//  Created by Gabriel Marinho da Silva on 30/10/20.
//

import Foundation

class CategoryViewModel {
    
    var service = CategoryManager()
    
    var categories = [String]()
    
    func getCategories(completion: @escaping () -> Void) {
        
        service.fetchData { [weak self] categories, error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let categories = categories {
                for item in categories {
                    self?.categories.append(item)
                }
                completion()
            }
        }
    }
}
