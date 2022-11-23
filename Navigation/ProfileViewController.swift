//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 23.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Заголовок2"
        self.view.backgroundColor = UIColor.blue
        self.navigationItem.title = "ProfiledVC"
        let tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
       
        self.tabBarItem = tabBarItem
    }
    


}
