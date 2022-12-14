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
        var imageSize = UIScreen.main.bounds.width
        var image = UIImageView(frame: CGRect(x: 0, y: 105, width: imageSize, height: imageSize))
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
    
    private var likes: UILabel = {
        var likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular, width: .standard)
        likes.textColor = .black
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        likes.translatesAutoresizingMaskIntoConstraints = false
        views.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            title.heightAnchor.constraint(equalToConstant: 100),
            title.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            image.topAnchor.constraint(equalTo: title.safeAreaLayoutGuide.bottomAnchor),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            likes.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            likes.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 2 - 16),
            likes.heightAnchor.constraint(equalToConstant: 50),
            likes.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            views.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            views.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 2 - 16),
            views.heightAnchor.constraint(equalToConstant: 50),
            views.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            content.topAnchor.constraint(equalTo: image.safeAreaLayoutGuide.bottomAnchor),
            content.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            content.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            content.bottomAnchor.constraint(equalTo: likes.safeAreaLayoutGuide.topAnchor)
        ])
        
    }
}
