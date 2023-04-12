//
//  RMCharacterViewController.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 10/04/23.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {
    private let characterListView = RMCharacterListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Characters"
        self.view.backgroundColor = .systemBackground
        view.addSubview(characterListView)
        setupView()
    }
    
    private func setupView(){
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
