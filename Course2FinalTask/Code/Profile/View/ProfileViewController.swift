//
//  ProfileViewController.swift
//  Course2FinalTask
//
//  Created by Олеся on 09.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

 final class ProfileViewController: UICollectionViewController {
    enum ListType {
           case followers
           case following
           case likes
           
           var title: String {
               switch self {
               case .likes: return "Likes"
               case .following: return "Following"
               case .followers: return "Followers"
               }
           }
       }
    
    var presenter: ProfileOutputProtocol!
    private var profileFeedPosts = [ProfileCellObject]()
    private var profileHeader: ProfileHeaderObject?
    private let itemsPerRow: CGFloat = 3
    private let sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
    super.init(collectionViewLayout: layout)
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let headerView: ProfileHeaderView = {
           let headerView = ProfileHeaderView(frame: .zero)
           headerView.translatesAutoresizingMaskIntoConstraints = false
           headerView.backgroundColor = .gray
           headerView.isUserInteractionEnabled = true
           //        headerView.addGestureRecognizer(headerTapGesture)
           return headerView
       }()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
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
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: ProfileHeaderView.self), for: indexPath) as? ProfileHeaderView else {return UICollectionReusableView()}
        let headerData = profileHeader
        
        header.configurationHeader(headerData!)
        return header
    }
}

// MARK: InputProtocol

extension ProfileViewController: ProfileInputProtocol {
    
    func setupInitialState() {
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
        self.tabBarItem.title = presenter.title
        self.navigationItem.title = header.userName
        collectionView.reloadData()
    }
}
// MARK: Layout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInset.right
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInset.bottom
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding =  sectionInset.left * (itemsPerRow + 1)
        let widthGenerally = collectionView.frame.width - padding
        let itemWidth = widthGenerally / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize( width: self.view.frame.width, height: 86)
    }
    
}
// MARK: CellDelegateProtocol
