//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 29.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var posts: [Post] = []
    var myTabelView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPosts()
        createTable()
        setupTable()
    }
    
    func createPosts() {
        let post1 = Post(title: "Lorem ipsum dolor sit amet", author: "Author1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: "Image 1", likes: 3, views: 3)
        let post2 = Post(title: "Post2", author: "Author2", description: "Description2", image: "Image 1", likes: 3, views: 3)
        let post3 = Post(title: "Post3", author: "Author3", description: "Description3", image: "Image 1", likes: 3, views: 3)
        let post4 = Post(title: "Post4", author: "Author4", description: "Description4", image: "Image 1", likes: 3, views: 3)
        posts.insert(post1, at: 0)
        posts.insert(post2, at: 1)
        posts.insert(post3, at: 2)
        posts.insert(post4, at: 3)
    }
    
    func createTable() {

        self.myTabelView = UITableView(frame: view.bounds, style: .plain)
        myTabelView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        self.myTabelView.delegate = self
        self.myTabelView.dataSource = self
        
        view.addSubview(myTabelView)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
        
        cell.post = posts[indexPath.row]
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return myTabelView.bounds.height
    }
}

