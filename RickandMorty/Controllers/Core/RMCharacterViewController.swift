//
//  RMCharacterViewController.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 10/04/23.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Characters"
        self.view.backgroundColor = .systemBackground
        
        let request = RMRequest(endPoint: RMEndPoint.character,queryParameters: [URLQueryItem(name: "name", value: "rick"),URLQueryItem(name: "status", value: "alive")])
        print(request.url)
    }

}
