//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Jiradet Amornpimonkul on 4/15/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let titlesPosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterImageView)
        contentView.addSubview(titleLable)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let titlesPosterImageViewConstraints = [
            titlesPosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlesPosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlesPosterImageView.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let titleLableConstraints = [
            titleLable.leadingAnchor.constraint(equalTo: titlesPosterImageView.trailingAnchor, constant: 20),
            titleLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLable.trailingAnchor.constraint(equalTo: playTitleButton.leadingAnchor)
        ]
        
        let playTitleButtonConstraints = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playTitleButton.widthAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(titlesPosterImageViewConstraints)
        NSLayoutConstraint.activate(titleLableConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        titlesPosterImageView.sd_setImage(with: url)
        titleLable.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
