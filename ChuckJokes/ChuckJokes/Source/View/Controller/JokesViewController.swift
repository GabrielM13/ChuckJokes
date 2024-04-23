//
//  JokesViewController.swift
//  ChuckJokes
//
//  Created by Gabriel Marinho da Silva on 30/10/20.
//

import UIKit

class JokesViewController: UIViewController {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var jokeLabel: UILabel!
    @IBOutlet var loadingLabel: UIActivityIndicatorView!
    
    var category: String?
    var viewModel = JokesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setCardView()
        fetch()
    }
    
    func setViews() {
        title = category?.capitalized
    }
    
    func setCardView() {
        self.cardView.layer.cornerRadius = 10

    }
    
    func fetch() {
        loadingLabel.startAnimating()
        if let category = category {
            viewModel.getJoke(category: category) { [weak self] joke in
                self?.setJoke(joke: joke.value)
            }
        }
    }
    
    func setJoke(joke: String) {
        DispatchQueue.main.async {
            self.loadingLabel.stopAnimating()
            self.loadingLabel.hidesWhenStopped = true
            self.jokeLabel.text = joke
        }
    }
    
    @IBAction func nextJokeTapped(_ sender: UIButton) {
        loadingLabel.startAnimating()
        self.jokeLabel.text = ""
        
        if let category = category {
            viewModel.getJoke(category: category) { [weak self] joke in
                self?.setJoke(joke: joke.value)
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
