//
//  ProfileViewController.swift
//  Course2FinalTask
//
//  Created by Олеся on 05.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

final class FeedViewController: UITableViewController {
    
    var output: FeedViewOutputProtocol!
    
    private var feedCellObjects = [FeedCellObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedCellObjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedCell.self), for: indexPath) as? FeedCell else { return UITableViewCell() }
        
        let userData = feedCellObjects[indexPath.row]
        cell.configure(userData)
        
        return cell
    }
}

// MARK: - FeedViewInputProtocol
extension FeedViewController: FeedViewInputProtocol {
    func setupInitialState() {
        view.backgroundColor = .systemPink
        title = output.title
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FeedCell.self, forCellReuseIdentifier: String(describing: FeedCell.self))
    }
    
    func setPosts(_ objects: [FeedCellObject]) {
        feedCellObjects = objects
        
        tableView.reloadData()
    }
}
