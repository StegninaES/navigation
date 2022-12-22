//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 29.11.2022.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let posts: [Post] = PostBuilder.createPosts()
    let photos: [UIImage] = PhotosBuilder.createPhotos()
    var myTabelView = UITableView()
    let profileHeaderView = ProfileHeaderView()
    let headerView = PhotosTableViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        setupTable()
    }
    
    func createTable() {
        myTabelView = UITableView(frame: view.bounds, style: .plain)
        myTabelView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        myTabelView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        self.myTabelView.delegate = self
        self.myTabelView.dataSource = self
        view.addSubview(myTabelView)
        myTabelView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTable() {
        myTabelView.translatesAutoresizingMaskIntoConstraints = false
        myTabelView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        myTabelView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        myTabelView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        myTabelView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        }
        return 160
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return profileHeaderView
        }
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapRecognizer.delegate = self
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        headerView.addGestureRecognizer(tapRecognizer)

        return headerView
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
        let photosViewController: PhotosViewController = PhotosViewController()
        photosViewController.photos = PhotosBuilder()
        guard navigationController?.topViewController == self else { return }
        
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
        cell.post = posts[indexPath.row]
        return cell
    }
}

