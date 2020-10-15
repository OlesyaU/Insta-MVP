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
    private let cell = FeedCell()
    var dobTap:((Int, Bool) -> Void)?
    var isliked: Bool? {
        didSet{
//            cell.datA?.isliked = isliked!
            cell.isLiked = isliked!
             print("Из контроллера из свойства \(isliked)")
        }
    }
    var likesCount: Int? {
        didSet{
//            cell.datA?.likesCount = likesCount!
            cell.likesCount = likesCount
            print("Из контроллера из свойства\(likesCount)")
        }
    }
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
//        presenter.doubleTappedLike = {[ weak self] int,bool in
//            self?.cell.datA?.likesCount = int
//            self?.dobTap!(int,bool)
//            print(int)
            
//            self?.likesCount = int
//            self?.cell.isLiked = bool
//            self?.cell.datA?.isliked = bool
//            self?.cell.likesCount = int
//            self?.isliked = bool
//             print(bool)
//        }
        }
    private func dobtap() {
        presenter.doubleTappedLike = {[weak self] int, booool in
            self?.likesCount = int
            self?.isliked = booool
        }
    }
}
