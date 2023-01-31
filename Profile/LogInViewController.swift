//
//  LogInViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 06.12.2022.
//

import UIKit
import SwiftUI

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var stackView: UIStackView = {
        var stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var scrollView: UIScrollView = {
        var scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 3000)
        return scroll
    }()
    
    private lazy var login: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        let myColor : UIColor = .lightGray
        textField.layer.borderColor = myColor.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.tintColor = UIColor(named: "MyCS")
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    
    private lazy var password: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        let myColor : UIColor = .lightGray
        textField.layer.borderColor = myColor.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.tintColor = UIColor.red
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private var alert: UILabel = {
        var alert = UILabel()
        alert.isHidden = true
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.font = UIFont.systemFont(ofSize: 12, weight: .regular, width: .standard)
        alert.textColor = .red
        alert.text = "пароль должен содержать более 3 символов"
    
        return alert
    }()
    
    private var logo: UIImageView = {
        var logoView = UIImageView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
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
        btn.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.tabBarItem = tabBarItem
        view.addSubview(scrollView)
        view.backgroundColor = .white
        
        stackView.addSubview(logo)
        stackView.addSubview(login)
        stackView.addSubview(password)
        stackView.addSubview(button)
        stackView.addSubview(alert)
        scrollView.addSubview(stackView)
        
        setupConstraints()
        subscribeKeyboardEvents()
    }
    
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

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.widthAnchor),
            
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.centerXAnchor.constraint (equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.centerYAnchor.constraint (equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            logo.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.centerXAnchor),
            
            login.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            login.centerXAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.centerXAnchor),
            login.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            login.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            login.heightAnchor.constraint(equalToConstant: 50),
            
            password.topAnchor.constraint(equalTo: login.bottomAnchor),
            password.centerXAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.centerXAnchor),
            password.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            password.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            password.heightAnchor.constraint(equalToConstant: 50),
            
            button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            alert.topAnchor.constraint(equalTo: password.bottomAnchor),
            alert.leadingAnchor.constraint(equalTo: password.leadingAnchor)
        ])
    }
    
    @objc func buttonAction(sender: UIButton) {
        if loginAndPasswordIsCorrect() {
            let profileViewController = ProfileViewController()
            guard navigationController?.topViewController == self else { return }
            navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
    
    private func loginAndPasswordIsCorrect() -> Bool {
        if login.text?.count == 0 {
            login.backgroundColor = .red
            return false
        } else {
            login.layer.backgroundColor = UIColor.systemGray6.cgColor
        }
        
        if password.text?.count == 0 {
            password.backgroundColor = .red
            return false
        } else if password.text!.count < 4 {
            alert.isHidden = false
            return false
        } else {
            password.layer.backgroundColor = UIColor.systemGray6.cgColor
        }
        
        if login.text != "Login" {
            showAlert()
            return false
        }
    
        if password.text != "1234" {
            showAlert()
            return false
        }
        return true
    }
    
    private func showAlert() {
        let alertMessage = UIAlertController(title: "Ошибка",
               message: "Неверный логин или пароль",
               preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertMessage, animated: true)
    }

}
