//
//  FeedViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 23.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Заголовок"
        self.view.backgroundColor = UIColor.green
        self.navigationItem.title = "FeedVC"
        let tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        self.tabBarItem = tabBarItem
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Жмяк", for: .normal)
        button.backgroundColor = .brown
         
        button.addTarget(self, action: #selector(buttonAction), for: .allTouchEvents)

        self.view.addSubview(button)
        
    }

    @objc func buttonAction(sender: UIButton!) {
        let postViewController: PostViewController = PostViewController()
        
        guard navigationController?.topViewController == self else { return }
        
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
