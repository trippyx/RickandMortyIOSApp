//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 12/04/23.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel{
     let characterName:String
     private let characterStatus:RMCharactersStatus
     let characterImageUrl:URL?
    
    //MARK: -
    
    init(characterName:String,
         characterStatus:RMCharactersStatus,
         characterImageUrl:URL?){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText:String{
        return characterStatus.rawValue
    }
    
    public func fetchImage(completion:@escaping (Result<Data,Error>)->Void){
        //TODO: Abstact it to imageManager
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
