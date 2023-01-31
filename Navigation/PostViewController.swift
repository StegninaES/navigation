//
//  PostViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 23.11.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = post?.title
        self.view.backgroundColor = UIColor.white
        
        let rifhtBarButton = UIBarButtonItem(title: "Button", style: .done, target: self, action:#selector(goToInfo))
    
        navigationItem.rightBarButtonItem = rifhtBarButton
    }
    
    @objc func goToInfo(_ sender: UIButton) {
        let infoViewController: InfoViewController = InfoViewController()
        guard navigationController?.topViewController == self else { return }
        self.navigationController?.pushViewController(infoViewController, animated: true)
    }
    
}
