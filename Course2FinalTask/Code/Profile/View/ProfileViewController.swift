//
//  ProfileViewController.swift
//  Course2FinalTask
//
//  Created by Олеся on 09.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

 final class ProfileViewController: UICollectionViewController {
    
    var presenter: ProfileOutputProtocol!
    private var profileFeedPosts = [ProfileCellObject]()
    private var profileHeader: ProfileHeaderObject?
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
    super.init(collectionViewLayout: layout)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: UICollectionViewDataSource

override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileFeedPosts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProfileCell.self), for: indexPath) as? ProfileCell else {return UICollectionViewCell()}
        let post = profileFeedPosts[indexPath.row]
        cell.configuration(post)
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: ProfileHeaderObject.self), for: indexPath) as? ProfileHeaderView else {return UICollectionReusableView()}
        return header
    }
}

extension ProfileViewController: ProfileInputProtocol {
    
    func setupInitialState() {
        title = presenter.title
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .white
        self.collectionView!.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: ProfileHeaderView.self))
        self.collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: String(describing: ProfileCell.self))
        
    }
    
    func setPosts(_ posts: [ProfileCellObject]) {
        profileFeedPosts = posts
        collectionView.reloadData()
    }
    
    func setHeader(_ header: ProfileHeaderObject) {
        profileHeader = header
        collectionView.reloadData()
    }
    
    
    
}
