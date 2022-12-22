//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Стегнина Елена on 19.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifier = "PhotosTableViewCell"
    
    private var title: UILabel =  {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.text = "Photos"

        return title
    }()
    
    private var firstImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Image 5")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 6.0
        
        return image
    }()
    
    private var secondImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Image 6")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 6.0
        
        return image
    }()
    
    private var thirdImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Image 7")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 6.0
        
        return image
    }()
    
    private var fourImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Image 8")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 6.0
        
        return image
    }()

    private var arrow: UILabel = {
        var arrow = UILabel()
        arrow.font = UIFont.boldSystemFont(ofSize: 24)
        arrow.text = "→"
        arrow.textAlignment = .right
        arrow.translatesAutoresizingMaskIntoConstraints = false
        
        return arrow
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        contentView.addSubview(title)
        contentView.addSubview(firstImage)
        contentView.addSubview(secondImage)
        contentView.addSubview(thirdImage)
        contentView.addSubview(fourImage)
        contentView.addSubview(arrow)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func setupConstraints() {
        let imageSize = (UIScreen.main.bounds.width - 48) / 4
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrow.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

            firstImage.topAnchor.constraint(equalTo: title.bottomAnchor, constant: -12),
            firstImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            firstImage.widthAnchor.constraint(equalToConstant: imageSize),
            firstImage.heightAnchor.constraint(equalToConstant: imageSize),
        
            secondImage.topAnchor.constraint(equalTo: title.bottomAnchor, constant: -12),
            secondImage.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 8),
            secondImage.widthAnchor.constraint(equalToConstant: imageSize),
            secondImage.heightAnchor.constraint(equalToConstant: imageSize),
            
            thirdImage.topAnchor.constraint(equalTo: title.bottomAnchor, constant: -12),
            thirdImage.leadingAnchor.constraint(equalTo: secondImage.trailingAnchor, constant: 8),
            thirdImage.widthAnchor.constraint(equalToConstant: imageSize),
            thirdImage.heightAnchor.constraint(equalToConstant: imageSize),
            
            fourImage.topAnchor.constraint(equalTo: title.bottomAnchor, constant: -12),
            fourImage.leadingAnchor.constraint(equalTo: thirdImage.trailingAnchor, constant: 8),
            fourImage.widthAnchor.constraint(equalToConstant: imageSize),
            fourImage.heightAnchor.constraint(equalToConstant: imageSize),
            
            contentView.bottomAnchor.constraint(equalTo: thirdImage.bottomAnchor, constant: 12)
        ])
    }
}
