//
//  ProfileCell.swift
//  Course2FinalTask
//
//  Created by Олеся on 09.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

 final class ProfileCell: UICollectionViewCell {
    
    lazy var postImage: UIImageView = {
          let image = UIImageView()
          image.isUserInteractionEnabled = true
          image.translatesAutoresizingMaskIntoConstraints = false
          return image
      }()
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          addSubview(postImage)
          setConstraints()
      }
    
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      private func setConstraints() {
          postImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
          postImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
          postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
          postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
      }
}
