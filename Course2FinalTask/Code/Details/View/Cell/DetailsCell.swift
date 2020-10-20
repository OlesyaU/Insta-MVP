//
//  DetailsCell.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

final class DetailsCell: UITableViewCell {

    var object: DetailsObject?
    
    private let avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.contentMode = .scaleAspectFit
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        label.sizeToFit()
        label.numberOfLines = 0
        label.minimumScaleFactor = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.groupTableViewBackground
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(_ objecT: DetailsObject) {
        avatarImageView.image = objecT.avatar
        nameLabel.text = objecT.userName
        
    }
    
//    MARK: Layout
    
    private func addSubviews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(dividerView)
        contentView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            avatarImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            avatarImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
            
            dividerView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
            dividerView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
            dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
}

