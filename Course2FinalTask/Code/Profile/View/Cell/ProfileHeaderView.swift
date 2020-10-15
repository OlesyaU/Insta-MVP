//
//  ProfileHeaderView.swift
//  Course2FinalTask
//
//  Created by Олеся on 09.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

final class ProfileHeaderView: UICollectionReusableView {
    private let avatarHeight: CGFloat = 70
    private let constraint: CGFloat = 8
    
 lazy var avatarImage: UIImageView = {
          let avatar = UIImageView()
          avatar.translatesAutoresizingMaskIntoConstraints = false
          avatar.contentMode = .scaleAspectFit
          avatar.layer.cornerRadius = avatarHeight / 2
          avatar.clipsToBounds = true
          return avatar
      }()
      
  lazy var nameLabel: UILabel  = {
          let nameLabel = UILabel()
          nameLabel.translatesAutoresizingMaskIntoConstraints = false
          nameLabel.font = .systemFont(ofSize: 14)
          nameLabel.textColor = .black
          return nameLabel
      }()
      
     lazy var followersLabel: UILabel  = {
          let followersLabel = UILabel()
          followersLabel.translatesAutoresizingMaskIntoConstraints = false
          followersLabel.font = .systemFont(ofSize: 14, weight: .semibold)
          followersLabel.textColor = .black
          followersLabel.isUserInteractionEnabled = true
//          followersLabel.addGestureRecognizer(followersTapGesture)
          return followersLabel
      }()
      
    lazy var followingLabel: UILabel  = {
          let followingLabel = UILabel()
          followingLabel.translatesAutoresizingMaskIntoConstraints = false
          followingLabel.font = .systemFont(ofSize: 14, weight: .semibold)
          followingLabel.textColor = .black
          followingLabel.textAlignment = .right
          followingLabel.isUserInteractionEnabled = true
//          followingLabel.addGestureRecognizer(followingTapGesture)
          return followingLabel
      }()
      
   private let containerView: UIStackView = {
          let container = UIStackView()
          container.translatesAutoresizingMaskIntoConstraints = false
          container.spacing = 0
          container.alignment = .center
          container.axis = .horizontal
          container.distribution = .fillEqually
          return container
      } ()
      
//      private lazy var followersTapGesture = UITapGestureRecognizer(target: self, action: #selector(followersTapped(recognizer:)))
//      private lazy var followingTapGesture = UITapGestureRecognizer(target: self, action: #selector(followingTapped(recognizer:)))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
          addSubViews()
          avatarConstraints()
          nameLabelConstraints()
          containerViewConstraints()
}
   
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
//    MARK: - Configuration
    
      func configurationHeader(_ header: ProfileHeaderObject) {
       avatarImage.image = header.avatar
         nameLabel.text = header.fullName
       followersLabel.text = "Followers: \(header.followers)"
      followingLabel.text = "Following: \(header.following)"
        }
    
    

//      @objc private func followersTapped(recognizer: UITapGestureRecognizer) {
//          onShowFollowers?()
//      }
//
//      @objc private func followingTapped(recognizer: UITapGestureRecognizer) {
//          onShowFollowing?()
//      }
  }


extension ProfileHeaderView {
    
//   MARK: - Layout
    
    private func addSubViews() {
          addSubview(avatarImage)
          addSubview(nameLabel)
          addSubview(containerView)
          containerView.addSubview(followersLabel)
          containerView.addSubview(followingLabel)
      }
      
      private func avatarConstraints() {
          avatarImage.heightAnchor.constraint(equalToConstant: avatarHeight).isActive = true
          avatarImage.widthAnchor.constraint(equalTo: avatarImage.heightAnchor).isActive = true
          avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constraint).isActive = true
          avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: constraint).isActive = true
          avatarImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -constraint).isActive = true
      }
      
      private func nameLabelConstraints() {
          nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: constraint).isActive = true
          nameLabel.bottomAnchor.constraint(equalTo: followersLabel.topAnchor).isActive = true
          nameLabel.heightAnchor.constraint(equalTo: avatarImage.heightAnchor, multiplier: 1 / 2).isActive = true
          nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: constraint).isActive = true
          nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
      }
      
      private func containerViewConstraints() {
          followersLabelConstraints()
          followingLabelConstraints()
//          containerView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1 / 2).isActive = true
          containerView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
          containerView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: constraint).isActive = true
          containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constraint * 2).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
      }
      
      private func followersLabelConstraints() {
          followersLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
          followersLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
          followersLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: constraint).isActive = true
          followersLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
      }
      
      private func followingLabelConstraints() {
          followingLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
          followingLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
          followingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
          followingLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
      }
    }
