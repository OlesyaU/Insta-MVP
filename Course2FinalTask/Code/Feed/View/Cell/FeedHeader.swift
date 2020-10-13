//
//  FeedHeader.swift
//  Course2FinalTask
//
//  Created by Олеся on 08.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

  final class FeedHeader: UIView {
   
   let avatarImageView: UIImageView = {
       let imageView = UIImageView(frame: .zero)
       imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.isUserInteractionEnabled = true
       return imageView
   }()
   
   let nameLabel: UILabel = {
       let nameLabel = UILabel(frame: .zero)
       nameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
       nameLabel.translatesAutoresizingMaskIntoConstraints = false
       nameLabel.textColor = .black
       return nameLabel
   }()
   
  let dateLabel: UILabel = {
       let dateLabel = UILabel()
       dateLabel.font = .systemFont(ofSize: 14)
       dateLabel.textColor = .black
       dateLabel.translatesAutoresizingMaskIntoConstraints = false
       return dateLabel
   }()
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       
       addSubviewsToHeader()
       avatarConstraints()
       nameConstraints()
       dateConstraints()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   // MARK: - Helpers

   
   private func addSubviewsToHeader() {
       addSubview(avatarImageView)
       addSubview(nameLabel)
       addSubview(dateLabel)
   }
   
   private func avatarConstraints(){
       avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
       avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
       avatarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
       avatarImageView.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
       avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor).isActive = true
   }
   
   private func nameConstraints() {
       nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8).isActive = true
       nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
       nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
   }
   
   private func dateConstraints() {
       dateLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8).isActive = true
       dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
       dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
   }
    
    
    
}
