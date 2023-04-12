//
//  RMCharacterCollectionViewCell.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 12/04/23.
//

import UIKit

/// Single Cell for Character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let identifier = "RMCharacterCollectionViewCell"
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        return nameLabel
    }()
    
    private let statusLabel:UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .systemFont(ofSize: 16, weight: .regular)
        return statusLabel
    }()
    
    //MARK: -
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubViews(imageView,nameLabel,statusLabel)
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,constant: -3),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = ""
        statusLabel.text = ""
    }
    
    public func configue(with viewModel:RMCharacterCollectionViewCellViewModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage {[weak self] result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    let image = UIImage(data: success)
                    self?.imageView.image = image
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
