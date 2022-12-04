//
//  FeedViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 23.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var stackView: UIStackView = {
        var uiStack = UIStackView()
        uiStack.axis = .vertical
        uiStack.distribution = .fillEqually
        uiStack.alignment  = .fill
        uiStack.spacing = 10
        uiStack.translatesAutoresizingMaskIntoConstraints = false
        return uiStack
    }()
    
    private lazy var previousPost: UIButton = {
        var newBtn = UIButton()
        newBtn.translatesAutoresizingMaskIntoConstraints = false
        newBtn.setTitle("Предыдущий пост", for: .normal)
        newBtn.backgroundColor = .systemPink
        newBtn.addTarget(self, action: #selector(buttonPressed), for: .allTouchEvents)
        newBtn.layer.cornerRadius = 50.0
        newBtn.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        newBtn.layer.shadowRadius = 50.0
        newBtn.layer.shadowColor = UIColor(.black).cgColor
        newBtn.layer.shadowOpacity = 0.7
        return newBtn
    }()
    
    private lazy var nextPost: UIButton = {
        var newBtn = UIButton()
        newBtn.translatesAutoresizingMaskIntoConstraints = false
        newBtn.setTitle("Следующий пост", for: .normal)
        newBtn.backgroundColor = .darkGray
        newBtn.addTarget(self, action: #selector(buttonPressed), for: .allTouchEvents)
        newBtn.layer.cornerRadius = 50.0
        newBtn.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        newBtn.layer.shadowRadius = 50.0
        newBtn.layer.shadowColor = UIColor(.black).cgColor
        newBtn.layer.shadowOpacity = 0.7
        return newBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        stackView.addArrangedSubview(previousPost)
        stackView.addArrangedSubview(nextPost)
        
        previousPost.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        previousPost.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        self.title = "Заголовок"
        self.view.backgroundColor = UIColor.green
        self.navigationItem.title = "Список постов"
        
        let tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        self.tabBarItem = tabBarItem
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        let postViewController: PostViewController = PostViewController()
        if sender.titleLabel?.text == "Предыдущий пост" {
            postViewController.post = Post(title: "Предыдущий пост")
            postViewController.view.backgroundColor = .systemPink
        } else {
            postViewController.post = Post(title: "Следущий пост")
            postViewController.view.backgroundColor = .darkGray
        }
        guard navigationController?.topViewController == self else { return }
        
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
