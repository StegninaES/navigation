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
        profileHeaderView.frame = self.view.frame
    }
}


