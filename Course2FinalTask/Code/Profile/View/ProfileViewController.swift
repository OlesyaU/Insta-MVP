//
//  ProfileViewController.swift
//  Course2FinalTask
//
//  Created by Олеся on 09.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Celll"
private let reuseHeaderID = "HeaderID"

 final class ProfileViewController: UICollectionViewController {
    
    private var presenter: ProfilePresenterProtocol!
    private let profileFeedPosts = [ProfileCellObject]()
//    private let cell = ProfileCell()
//    private let header = ProfileHeaderView()

    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
    super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    
        self.collectionView!.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderID")
        self.collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: "Celll")
        self.view.backgroundColor = .green
       
    }


    // MARK: UICollectionViewDataSource

   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Celll", for: indexPath) as? ProfileCell else {return UICollectionViewCell()}
        cell.backgroundColor = .blue
//        cell.postImage.image = profileFeedPosts[indexPath.row].image
    
        return cell
    }

    // MARK: UICollectionViewDelegate

   
}
extension ProfileViewController: ProfileViewInputProtocol {
    func setVC() -> UIViewController {
        return self
    }
    
    
    func setUserPosts(images: [UIImage]) {
        for i in images {
//            self.cell.postImage.image = i

    }
    }
    
    func setUserInfo(avatar: UIImage, name: String, followers: String, following: String, title: String) {
    
//        self.header.avatarImage.image = avatar
//        self.header.nameLabel.text = name
//       self.header.followersLabel.text = followers
//        self.header.followingLabel.text = following
        self.title = title
    }
      
}
