//
//  DetailsController.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit


class DetailsController: UITableViewController {
    
    enum Title: String {
        case likes = "Likes"
        case followers = "Following"
        case following = "Followers"
    }
    
    
    var presenter: DetailsOutputProtocol!
    var users = [DetailsObject]()
    
    init(){
        super.init(style: .plain)
   }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Title.likes.rawValue
        print("Сработал вьюдидоад из дитэйлМС \(users.count)")
        presenter.viewisLikes()
//        setupInitialState()
//        setUsers(users)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users.count)
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailsCell.self), for: indexPath) as? DetailsCell else {return UITableViewCell()}
        cell.delegate = self
       
        let dataForCell = users[indexPath.row]
        cell.configure(dataForCell)
        
        return cell
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let profileViewController = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())
//        navigationController?.pushViewController(profileViewController, animated: true)
        print("Tap")
    }
    
}
extension DetailsController: DetailsInputProtocol {
    
    func setupInitialState() {
        tableView.backgroundColor = .yellow
//        title = presenter.title
        tableView.dataSource = self
        tableView.delegate = self

            tableView.register(DetailsCell.self, forCellReuseIdentifier: String(describing: DetailsCell.self))
    }
    
    func setUsers(_ userses: [DetailsObject]) {
        
        users = userses
        tableView.reloadData()
    }
}

extension DetailsController: DetailsCellDelegate {
    
    func getData() {
//        feedPresenter = FeedPresenter(model: FeedModel())
//        feedPresenter.likeLabelTapped(<#T##post: FeedCellObject##FeedCellObject#>)
        
    }
    
}
