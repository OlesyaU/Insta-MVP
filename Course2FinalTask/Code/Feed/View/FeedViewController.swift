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
    private var celL: FeedCell?
    var dobTap:((Int, Bool) -> Void)?
    
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
        celL = cell
        cell.delegate = self
        let userData = feedCellObjects[indexPath.row]
        cell.configure(userData)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
    
    func postImageDoubleTapped(_ post: FeedCellObject) {
        presenter.postImageDoubleTapped(post)
        dobtap()
    }
    
    private func dobtap() {
        presenter.doubleTappedLike = {[weak self] int, booool in
            guard var likes = self?.celL?.likesCount else { print("likes from cv doesn't work")
                return }
           likes = int
            guard var isliked = self?.celL?.isLiked else { print("liked from cv doesn't work")
                return
            }
            isliked = booool
//            self.cell?.likesCount = int
//            self?.cell.isLiked = booool
            print(booool, int)
            print(likes, isliked)
        }
    }
}
