//
//  InfoViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 25.11.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        
        let button = UIButton(frame: CGRect(x: 200, y: 150, width: 100, height: 50))
        button.setTitle("Щелк", for: .normal)
        button.backgroundColor = .brown
        
        button.addTarget(self, action: #selector(buttonAction), for: .allTouchEvents)
        
        self.view.addSubview(button)
    }
                         
    @objc func buttonAction(sender: UIButton) {
        let alert = UIAlertController(title: "Внимание", message: "Вы хотите удалить этот раздел?", preferredStyle: .alert)
        
        let yesBtn = UIAlertAction(title: "да", style: .default , handler: {(alert: UIAlertAction!) in print("YES")})
        alert.addAction(yesBtn)
        
        let noBtn = UIAlertAction(title: "нет", style: .default, handler: {(alert: UIAlertAction!) in print("NO")})
        alert.addAction(noBtn)
        present(alert, animated: true, completion: nil)
    }
}
