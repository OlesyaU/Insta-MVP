//
//  DetailsController.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit


class DetailsController: UITableViewController {
    
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
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailsCell.self), for: indexPath) as? DetailsCell else {return UITableViewCell()}
        let dataForCell = users[indexPath.row]
        cell.configure(dataForCell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let profileViewController = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}
extension DetailsController: DetailsInputProtocol {
    
    func setupInitialState() {
        title = presenter.title
//        tableView.dataSource
//        tableView.delegate = self
                tableView.separatorStyle = .none
            tableView.register(DetailsCell.self, forCellReuseIdentifier: String(describing: DetailsCell.self))
    }
    
    func setUsers(_ userses: [DetailsObject]) {
        users = userses
        tableView.reloadData()
    }
    
}
