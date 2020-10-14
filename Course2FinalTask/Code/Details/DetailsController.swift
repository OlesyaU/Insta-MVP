//
//  DetailsController.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit


class DetailsController: UITableViewController {
    
    typealias ListType = ProfileViewController.ListType
//
    var presenter: DetailsOutputProtocol!
    private var users: [DetailsObject]?
    private var objects =  [ProfileModel]()

    init(objects: [ProfileModel], type: ListType) {
        self.objects = objects
        super.init(style: .plain)


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReadyFollowers()
    }
    
    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModels.count
//    }
//    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailsCell.self), for: indexPath) as? DetailsCell else {return UITableViewCell()}
        
//        cell.viewModel = viewModels[indexPath.row]
        
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
//              title = type.title
                tableView.separatorStyle = .none
            tableView.register(DetailsCell.self, forCellReuseIdentifier: String(describing: DetailsCell.self))
    }
    
    func setUsers(_ userses: [DetailsObject]) {
        users = userses
    }
    
}
