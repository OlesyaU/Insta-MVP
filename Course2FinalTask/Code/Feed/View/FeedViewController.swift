//
//  ProfileViewController.swift
//  Course2FinalTask
//
//  Created by Олеся on 05.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

final class FeedViewController: UITableViewController {
    
    var presenter: FeedViewOutputProtocol!
    private var feedCellObjects = [FeedCellObject]()
    private var likesUsers = [DetailsObject]()
//    private  var user: ProfileHeaderObject?

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        presenter.viewIsReady()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedCellObjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedCell.self), for: indexPath) as? FeedCell else { return UITableViewCell() }
        cell.delegate = self
        let userData = feedCellObjects[indexPath.row]
        cell.configure(userData)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let cell = tableView.cellForRow(at: indexPath) as? FeedCell else {return}
        presenter.doubleTappedLike = { int, bool in
            cell.likesStory(int, bool)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - FeedViewInputProtocol
extension FeedViewController: FeedViewInputProtocol {
    func setupInitialState() {
        title = presenter.title
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FeedCell.self, forCellReuseIdentifier: String(describing: FeedCell.self))
    }
    
    func setPosts(_ objects: [FeedCellObject]) {
        feedCellObjects = objects
        tableView.reloadData()
    }
}

extension FeedViewController: FeedCellDelegate {
    func headerTapped(_ post: FeedCellObject) {
        presenter.headerTapped(post)
        profileTap()
    }
    
  func profileTap() {
        let profile = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
//        presenter.headerTapped = { obj, posts in
//            
//            profile.presenter.viewIsReady()
//            profile.setHeader(obj)
//            profile.setPosts(posts)
//        }
        navigationController?.pushViewController(profile, animated: true)
        
    }
    
    func postImageDoubleTapped(_ post: FeedCellObject) {
        presenter.postImageDoubleTapped(post)
        
        
    }
    func likeLabelTapped(_ post: FeedCellObject) {
        let detailsVC = DetailsController()

        navigationController?.pushViewController(detailsVC, animated: true)

        presenter.likesLabelTapped = { users in

            
        }

    }
    

    }

