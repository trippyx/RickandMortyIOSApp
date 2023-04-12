//
//  CharacterListViewModel.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 12/04/23.
//

import Foundation
import UIKit
final class RMCharacterListViewModel:NSObject{
    func fetchCharacters(){
        RMService.shared.execute(.listCharacterRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total \(model.info.count)")
                print("Page Result count \(model.results.first?.image)")
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RMCharacterListViewModel:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.identifier, for: indexPath) as! RMCharacterCollectionViewCell
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Kuldeep", characterStatus: .alive, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configue(with: viewModel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width,
                      height: width * 1.5)
    }
}
