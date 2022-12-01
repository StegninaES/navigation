//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Стегнина Елена on 29.11.2022.
//

import SwiftUI


class ProfileHeaderView: UIView {
    
    var userName = UILabel()
    var status = UILabel()
    var message = UITextField()
    var button = UIButton()
    var avatar = UIImageView(frame: CGRect(x: 180, y:200 , width: 120, height: 30))
    let scale: CGFloat
    
    override init(frame: CGRect) {
        scale = UIScreen.main.scale/1.5
        super.init(frame: frame)
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
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "Hipster Cat"
        userName.font = UIFont.boldSystemFont(ofSize: 18)
        userName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        userName.topAnchor.constraint(equalTo: topAnchor, constant: 27*scale + 100).isActive = true
    }
    
    private func setupStatus(){
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Waiting for something..."
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular, width: .standard)
        status.textColor = .gray
        status.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -49).isActive = true
        status.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupMessage() {
        message.translatesAutoresizingMaskIntoConstraints = false
        message.font = UIFont.systemFont(ofSize: 14, weight: .regular, width: .standard)
        message.textColor = .gray
        message.heightAnchor.constraint(equalToConstant: 40).isActive = true
        message.backgroundColor = .white
        message.layer.borderWidth = 1
        message.layer.borderColor = UIColor(.black).cgColor
        message.layer.cornerRadius = 12
        message.font = UIFont.systemFont(ofSize: 15, weight: .regular, width: .standard)
        message.widthAnchor.constraint(equalTo: userName.widthAnchor, constant: 1).isActive = true
        message.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 3).isActive = true
        message.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupButton() {
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16*scale).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor, constant: 16*scale).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -16*scale).isActive = true
        button.layer.cornerRadius = 4.0
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        createShadow()
    }
    
    @objc func buttonAction(sender:UIButton){
        print(message.text ?? "нет сообщений")
        status.text = message.text ?? "Waiting for something..."
    }
    
    func createShadow() {
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor(.black).cgColor
        button.layer.shadowOpacity = 0.7
    }
    
    private func setupImage() {
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.topAnchor.constraint(equalTo: topAnchor, constant: 16*scale + 100).isActive = true
        avatar.leftAnchor.constraint(equalTo: leftAnchor, constant: 16*scale).isActive = true
      
        var image = UIImage(named: "Image 1")
        let imageSize = CGSize(width: 80, height: 80)
        let imageWithBorder = UIGraphicsImageRenderer(size: imageSize).image { context in
            let imageFrame = CGRect(
                origin: .zero,
                size: imageSize
            )
            let circle = UIBezierPath(ovalIn: imageFrame)
            circle.addClip()
            image?.draw(in: imageFrame)
            circle.lineWidth = 3*scale
            UIColor.white.setStroke()
            circle.stroke()
        }
        
        avatar.image = imageWithBorder        
    }
}
