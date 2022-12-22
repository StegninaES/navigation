//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 22.12.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosViewController: UIViewController {
    
    var photosCollectionView = PhotosCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        title = "Photos gallery"
        view.backgroundColor = .white
        view.addSubview(photosCollectionView)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

}
