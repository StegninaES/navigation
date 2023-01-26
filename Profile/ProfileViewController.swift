//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Стегнина Елена on 29.11.2022.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var posts: [Post] = PostBuilder.createPosts()
    let photos: [UIImage] = PhotosBuilder.createPhotos()
    var myTabelView = UITableView()
    let profileHeaderView = ProfileHeaderView()
    let headerView = PhotosTableViewCell()
    var avatar: UIImageView!
    var bluredView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bluredView = UIView(frame: UIScreen.main.bounds)
        createTable()
        setupTable()
        setupAvatar()
    }
    
    func createTable() {
        myTabelView = UITableView(frame: view.bounds, style: .plain)
        myTabelView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        myTabelView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        self.myTabelView.delegate = self
        self.myTabelView.dataSource = self
        view.addSubview(myTabelView)
        myTabelView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTable() {
        myTabelView.translatesAutoresizingMaskIntoConstraints = false
        myTabelView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        myTabelView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        myTabelView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        myTabelView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func setupAvatar () {
        avatar = profileHeaderView.avatar
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleImageTap))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        avatar.isUserInteractionEnabled = true
        avatar.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func handleImageTap(gestureRecognizer: UIGestureRecognizer) {
        let scenes = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = scenes?.windows.last
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = UIScreen.main.bounds
        
        bluredView.addSubview(visualEffectView)
        bluredView.addSubview(self.avatar)

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
            avatar.isUserInteractionEnabled = false
            
            let scale = UIScreen.main.bounds.width / self.avatar.bounds.width
            self.avatar.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
            self.avatar.center.x = bluredView.center.x
            self.avatar.center.y = bluredView.bounds.midY
            
            self.view.layoutIfNeeded()
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
        button.setTitleColor(.white, for: .normal)
        button.setTitle("X", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = button.frame.size.height / 2.0
        button.addTarget(self, action: #selector(clossButtonTap), for: .allTouchEvents)

        return button
    }
    
    @objc func clossButtonTap()  {
        UIView.animate(withDuration: 0.5, animations: { [self] in
            avatar.isUserInteractionEnabled = false
            self.avatar.transform = CGAffineTransform.identity
            
            self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: { [self] in
                profileHeaderView.addSubview(avatar)
                profileHeaderView.setupConstraints()
                bluredView.removeFromSuperview()
            })
        })
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        }
        return 160
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return profileHeaderView
        }
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapRecognizer.delegate = self
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        headerView.addGestureRecognizer(tapRecognizer)

        return headerView
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
        let photosViewController: PhotosViewController = PhotosViewController()
        guard navigationController?.topViewController == self else { return }
        
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
        cell.post = posts[indexPath.row]
        cell.myVC = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { return true }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        myTabelView.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("delete")
            myTabelView.beginUpdates()
            posts.remove(at: indexPath.row)
            myTabelView.deleteRows(at: [indexPath], with: .automatic)
            myTabelView.endUpdates()
        }
    }
}

