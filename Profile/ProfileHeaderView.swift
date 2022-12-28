//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Стегнина Елена on 29.11.2022.
//

import SwiftUI


class ProfileHeaderView: UIView {
    
    static let identifier = "ProfileHeaderView"
    
    private var userName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private var status: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular, width: .standard)
        label.textColor = .gray
        return label
    }()
    
    private var message: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular, width: .standard)
        text.textColor = .gray
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(.black).cgColor
        text.layer.cornerRadius = 12
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular, width: .standard)
        return text
    }()
    
    private lazy var button: UIButton = {
        var btn = UIButton()
        btn.setTitle("Show status", for: .normal)
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.layer.cornerRadius = 4.0
        btn.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        btn.layer.shadowRadius = 4.0
        btn.layer.shadowColor = UIColor(.black).cgColor
        btn.layer.shadowOpacity = 0.7
        return btn
    }()
    
    private var avatar: UIImageView = {
        var imageView = UIImageView()
        var image = UIImage(named: "Image 1")
        let imageSize = CGSize(width: 100, height: 100)
        let imageWithBorder = UIGraphicsImageRenderer(size: imageSize).image { context in
            let imageFrame = CGRect(
                origin: .zero,
                size: imageSize
            )
            let circle = UIBezierPath(ovalIn: imageFrame)
            circle.addClip()
            image?.draw(in: imageFrame)
            circle.lineWidth = 3
            UIColor.white.setStroke()
            circle.stroke()
        }
        imageView.image = imageWithBorder
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(userName)
        addSubview(status)
        addSubview(message)
        addSubview(button)
        addSubview(avatar)
        setupUsername()
        setupStatus()
        setupMessage()
        setupButton()
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUsername() {
        userName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        userName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
    }
    
    private func setupStatus(){
        status.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -74).isActive = true
        status.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
    }
    
    private func setupMessage() {
        message.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 8).isActive = true
        message.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        message.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
    }
    
    private func setupButton() {
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 32).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        createShadow()
    }
    
    @objc func buttonAction(sender:UIButton){
        print(message.text ?? "нет сообщений")
        status.text = message.text ?? "Waiting for something..."
    }
    
    func createShadow() {
        
    }
    
    private func setupImage() {
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        avatar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
    }
}
