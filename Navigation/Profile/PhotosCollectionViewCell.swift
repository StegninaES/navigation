//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Стегнина Елена on 22.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotosCollectionViewCell"
    
    var bluredView: UIView!
    
    private lazy var image: UIImageView = {
        var image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 6.0
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleImageTap))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapRecognizer)
        
        return image
    }()

    func updateImage(photo:UIImage) {
        image.image = photo
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bluredView = UIView(frame: UIScreen.main.bounds)
        contentView.addSubview(image)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }
    
    @objc func handleImageTap(gestureRecognizer: UIGestureRecognizer) {
        let scenes = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = scenes?.windows.last
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = UIScreen.main.bounds
        
        bluredView.addSubview(visualEffectView)
        bluredView.addSubview(image)

        window!.addSubview(bluredView)
        
        let button = createClosseButton()
        bluredView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: bluredView.topAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: bluredView.trailingAnchor, constant: -20)
        ])
        
        button.layer.opacity = 0
        
        bluredView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, animations: { [self] in
            image.isUserInteractionEnabled = false
            
            let scale = UIScreen.main.bounds.width / image.bounds.width
            image.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
            image.center.x = bluredView.center.x
            image.center.y = bluredView.bounds.midY
            
            layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                button.layer.opacity = 1
            })
        })
    }
    
    func createClosseButton() -> UIButton  {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 20, y: 20, width: 36, height: 36)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("X", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = button.frame.size.height / 2.0
        button.addTarget(self, action: #selector(closeButtonTap), for: .allTouchEvents)

        return button
    }
    
    @objc func closeButtonTap()  {
        UIView.animate(withDuration: 0.5, animations: { [self] in
            image.isUserInteractionEnabled = true
            image.transform = CGAffineTransform.identity
            
            layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: { [self] in
                addSubview(image)
                setupConstraints()
                bluredView.removeFromSuperview()
            })
        })
    }
    
    func setupConstraints()  {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor)
       ])
    }
}


