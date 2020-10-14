//
//  FeedCell.swift
//  Course2FinalTask
//
//  Created by Олеся on 09.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

final class FeedCell: UITableViewCell {
    
    var delegate: FeedCellDelegate!
    var datA: FeedCellObject?
    
    private let headerView: FeedHeader = {
        let headerView = FeedHeader(frame: .zero)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.isUserInteractionEnabled = true
        //        headerView.addGestureRecognizer(headerTapGesture)
        return headerView
    }()
    
   
    private let footerView: FeedFooter = {
        
        let footerView = FeedFooter(frame: .zero)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.isUserInteractionEnabled = true
        
        //        footerView.onTapLike = { [unowned self] in
        //            self.delegate?.likeTapped(cell: self)
        //        }
        //
        //        footerView.onLikesLabelTapped = { [unowned self] in
        //            self.delegate?.likesLabelTapped(cell: self)
        //        }
        
        return footerView
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
       let postImageDoubleTapGesture: UITapGestureRecognizer = {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(postImageDoubleTapped))
            gesture.numberOfTapsRequired = 2
            return gesture
        }()
        imageView.addGestureRecognizer(postImageDoubleTapGesture)
        return imageView
    }()
    
    private let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.alpha = 0
        imageView.image = #imageLiteral(resourceName: "bigLike")
        return imageView
    }()
    private var likesCount: Int? {
           didSet {
            footerView.likesLabel.text = "Likes: \(String(describing: likesCount))"
               }
       }
       private var isLiked: Bool? {
           didSet {
               if isLiked! {
                   footerView.likeButton.tintColor = .systemBlue
               } else {
                   footerView.likeButton.tintColor = .lightGray
               }
           }
       }
    
        
    
    //    private lazy var headerTapGesture = UITapGestureRecognizer(target: self, action: #selector(postHeaderTapped(recognizer:)))
    //    private lazy var likeImageTapGesture = UITapGestureRecognizer(target: self, action:
    //        #selector(likeImageTapped(recognizer:)))
    //
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
 
        addSubviewsToCell()
        headerConstraints()
        footerConstraints()
        postImageConstraints()
        heartImageConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ data: FeedCellObject) {
        datA = data
        if data.isliked {
            footerView.likeButton.tintColor = .systemBlue
        } else {
            footerView.likeButton.tintColor = .lightGray
        }
        headerView.nameLabel.text = data.userName
        headerView.avatarImageView.image = data.userAvatar
        headerView.dateLabel.text = data.datePost
        
        footerView.descriptionLabel.text = data.description
        footerView.likesLabel.text = "Likes: \(data.likesCount)"
        
        postImageView.image = data.imagePost
    }
    
    //   //MARK: - Actions
    @objc private func postImageDoubleTapped() {
    
            delegate.postImageDoubleTapped(datA!)
            UIView.animate(withDuration: 2, animations: {
                self.heartImageView.alpha = 1
            }) { _ in
                self.heartImageView.alpha = 0
            }
        }
    //
    //    @objc private func postHeaderTapped(recognizer: UITapGestureRecognizer) {
    //        delegate?.postHeaderTapped(cell: self)
    //    }
    //
    //    @objc private func likeImageTapped(recognizer: UITapGestureRecognizer) {
    //        delegate?.likeTapped(cell: self)
    //    }
    //
        private func showLikeAnimation(completion: @escaping () -> Void) {
            UIView.animate(withDuration: 0.25, animations: {
                self.heartImageView.alpha = 1
            }) { _ in
                UIView.animate(withDuration: 0.25, delay: 0.15, options: .curveEaseOut, animations: {
                    self.heartImageView.alpha = 0
                }) { _ in
                    completion()
                }
            }
        }
    
   //MARK: - Layout
        
    private func addSubviewsToCell() {
        contentView.addSubview(headerView)
        contentView.addSubview(footerView)
        contentView.addSubview(postImageView)
        postImageView.addSubview(heartImageView)
    }
    
    private func headerConstraints() {
        headerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: postImageView.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func postImageConstraints() {
        postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor).isActive = true
    }
    
    private func footerConstraints() {
        footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        footerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        footerView.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive = true
        footerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func heartImageConstraint() {
        heartImageView.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor).isActive = true
        heartImageView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor).isActive = true
    }
}
