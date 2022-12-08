//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 29.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView: ProfileHeaderView = ProfileHeaderView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        let tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.tabBarItem = tabBarItem
        self.view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


