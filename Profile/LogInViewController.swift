//
//  LogInViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 06.12.2022.
//

import UIKit
import SwiftUI

class LogInViewController: UIViewController {
    
    var stackView: UIStackView = {
        var stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        return stack
    }()
    
    var scrollView: UIScrollView = {
        var scroll = UIScrollView(frame: .zero)
        scroll.backgroundColor = .darkGray
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 3000)
        return scroll
    }()
    
    private var login: UITextField = {
        var textField = UITextField()
        let myColor : UIColor = .lightGray
        textField.layer.borderColor = myColor.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.layer.backgroundColor = UIColor.systemGray.cgColor
        textField.tintColor = UIColor.red
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private var password: UITextField = {
        var textField = UITextField()
        let myColor : UIColor = .lightGray
        textField.layer.borderColor = myColor.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.layer.backgroundColor = UIColor.systemGray.cgColor
        textField.tintColor = UIColor.red
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private var logo: UIImageView = {
        var logoView = UIImageView()
        var logo = UIImage(named: "logo 1")
        let logoSize = CGSize(width: 100, height: 100)
        let logoWithBorder = UIGraphicsImageRenderer(size: logoSize).image { context in
            let imageFrame = CGRect(
                origin: .zero,
                size: logoSize
            )
           logo?.draw(in: imageFrame)
            UIColor.white.setStroke()
        }
        logoView.image = logoWithBorder
        return logoView
    }()
    
    private lazy var button: UIButton = {
        var btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        let image = UIImage(named: "blue_pixel.png")
        let imageView = UIImageView(image: image)
        imageView.alpha = 1
        btn.setBackgroundImage(image, for: .normal)
        imageView.alpha = 0.8
        btn.setBackgroundImage(image, for: .selected)
        btn.setBackgroundImage(image, for: .highlighted)
        btn.setBackgroundImage(image, for: .disabled)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    func subscribeKeyboardEvents (){
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillShow), name:
                                                UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
                                                #selector (keyboardWillHide), name:
                                                UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey]
                        as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height
                                                    - self.view.safeAreaInsets.bottom + 20 , right: 0)
    }
    @objc func keyboardWillHide(_ notification: NSNotification){
        self.scrollView.contentInset = .zero
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.widthAnchor).isActive = true
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint (equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint (equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func setupLogo() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        logo.centerXAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    private func setupLogin() {
        login.translatesAutoresizingMaskIntoConstraints = false
        login.topAnchor.constraint(equalTo: logo.topAnchor, constant: 120).isActive = true
        login.centerXAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        login.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        login.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        login.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupPassword() {
        password.translatesAutoresizingMaskIntoConstraints = false
        password.topAnchor.constraint(equalTo: login.bottomAnchor).isActive = true
        password.centerXAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        password.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        password.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    private func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 16).isActive = true
        button.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func buttonAction(sender: UIButton){
        let profileViewController = ProfileViewController()
        guard navigationController?.topViewController == self else { return }
        navigationController?.pushViewController(profileViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.backgroundColor = .white
        
        stackView.addSubview(logo)
        stackView.addSubview(login)
        stackView.addSubview(password)
        stackView.addSubview(button)
        scrollView.addSubview(stackView)
        
        setupStackView()
        setupScrollView()
        setupLogo()
        setupLogin()
        setupPassword()
        setupButton()
        subscribeKeyboardEvents()
    }

}
