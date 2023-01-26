//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Стегнина Елена on 12.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
    
    var post: Post? {
        didSet {
            guard let postItem = post else {return}
            title.text = postItem.title
            image.image = UIImage(named: postItem.image)
            content.text = postItem.description
            likes.text = "Likes: \(postItem.likes)"
            views.text = "Views: \(postItem.views)"
        }
    }
    
    private var title: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold, width: .standard)
        title.numberOfLines = 2
        return title
    }()
    
    private var image: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
    }()
    
    private var content: UILabel =  {
        var content = UILabel()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.numberOfLines = 0
        content.textColor = .systemGray
        content.font = UIFont.systemFont(ofSize: 14, weight: .regular, width: .standard)
      
        return content
    }()
    
    private lazy var likes: UILabel = {
        var likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular, width: .standard)
        likes.textColor = .black
        let tap = UITapGestureRecognizer(target: self, action: #selector(increaseLikes))
        likes.addGestureRecognizer(tap)
        likes.isUserInteractionEnabled = true
        return likes
    }()
    
    private var views: UILabel = {
        var views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular, width: .standard)
        views.textColor = .black
        views.textAlignment = .right
        
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
        contentView.addSubview(image)
        contentView.addSubview(content)
        contentView.addSubview(likes)
        contentView.addSubview(views)
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createConstraints()
    }
    
    @objc private func increaseLikes() {
        post!.likes += 1
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 18),
            title.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            image.topAnchor.constraint(equalTo: title.safeAreaLayoutGuide.bottomAnchor, constant: 18),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            content.topAnchor.constraint(equalTo: image.safeAreaLayoutGuide.bottomAnchor, constant: 18),
            content.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            content.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            likes.topAnchor.constraint(equalTo: content.safeAreaLayoutGuide.bottomAnchor, constant: 18),
            likes.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 2 - 16),
            likes.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            views.topAnchor.constraint(equalTo: content.safeAreaLayoutGuide.bottomAnchor, constant: 18),
            views.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 2 - 16),
            views.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            contentView.bottomAnchor.constraint(equalTo: views.bottomAnchor,constant: 18)
        ])
    }
}
