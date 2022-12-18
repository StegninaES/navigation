//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 29.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let posts: [Post] = PostBuilder.createPosts()
    var myTabelView = UITableView()
    let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        setupTable()
    }
    
    
    func createTable() {
        myTabelView = UITableView(frame: view.bounds, style: .plain)
        myTabelView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        self.myTabelView.delegate = self
        self.myTabelView.dataSource = self
//        myTabelView.rowHeight = UITableView.automaticDimension
//        myTabelView.estimatedRowHeight = 100
        view.addSubview(myTabelView)
        myTabelView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTable() {
        myTabelView.translatesAutoresizingMaskIntoConstraints = false
        myTabelView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        myTabelView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        myTabelView.centerXAnchor.constraint (equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        myTabelView.centerYAnchor.constraint (equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
        
        cell.post = posts[indexPath.row]
            
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

