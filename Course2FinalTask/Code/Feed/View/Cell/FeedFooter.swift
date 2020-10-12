//
//  FeedFooter.swift
//  Course2FinalTask
//
//  Created by Олеся on 08.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

 final class FeedFooter: UIView {
      let ident = "FeedFooter"

       
 lazy var likesLabel: UILabel = {
           let likesLabel = UILabel(frame: .zero)
           likesLabel.font = .systemFont(ofSize: 14, weight: .semibold)
           likesLabel.translatesAutoresizingMaskIntoConstraints = false
           likesLabel.textColor = .black
           likesLabel.isUserInteractionEnabled = true
//           likesLabel.addGestureRecognizer(tapGesture)
           return likesLabel
       }()
       
      lazy var descriptionLabel: UILabel = {
           let descriptionLabel = UILabel(frame: .zero)
           descriptionLabel.font = .systemFont(ofSize: 14)
           descriptionLabel.textColor = .black
           descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
           descriptionLabel.numberOfLines = 0
           descriptionLabel.sizeToFit()
           return descriptionLabel
       }()
       
       lazy  var likeButton: UIButton =  {
           let button = UIButton(type: .system)
           button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
           button.tintColor = .lightGray
//           button.addTarget(self, action: #selector(likeTapped(sender:)), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
       
//       private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(likesLabelTapped(recognizer:)))
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           
           addSubviews()
           
           likeButtonConstraints()
           likesLabelConstraints()
           descriptionLabelConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       // MARK: - Actions
       
//       @objc private func likeTapped(sender: UIButton) {
//           onTapLike?()
//       }
//
//       @objc private func likesLabelTapped(recognizer: UITapGestureRecognizer) {
//           onLikesLabelTapped?()
//       }
//
       private func addSubviews() {
           addSubview(likeButton)
           addSubview(likesLabel)
           addSubview(descriptionLabel)
       }
       
       private func likeButtonConstraints() {
           let constraints = [
               likeButton.heightAnchor.constraint(equalToConstant: 44),
               likeButton.widthAnchor.constraint(equalToConstant: 44),
               likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
               likeButton.topAnchor.constraint(equalTo: topAnchor)
           ]
           NSLayoutConstraint.activate(constraints)
       }
       
       private func likesLabelConstraints() {
           let constraints = [
               likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
               likesLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
               likesLabel.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor)
           ]
           NSLayoutConstraint.activate(constraints)
       }
       
       private func descriptionLabelConstraints() {
           let constraints = [
               descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
               descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
               descriptionLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor),
               descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
           ]
           NSLayoutConstraint.activate(constraints)
       }
}
