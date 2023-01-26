//
//  DetailsPostViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 26.01.2023.
//

import UIKit

class DetailsPostViewController: UIViewController {
    
    var details: UILabel = {
        var details = UILabel()
        details.translatesAutoresizingMaskIntoConstraints = false
        details.textColor = .black
        details.font = UIFont.systemFont(ofSize: 20, weight: .bold, width: .standard)
        details.numberOfLines = 0
        details.lineBreakMode = .byWordWrapping
        return details
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(details)
        createConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            
            details.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            details.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            details.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            details.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 18)
        ])
    }
}
