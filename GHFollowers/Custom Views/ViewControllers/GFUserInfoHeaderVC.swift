//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Vitor Bukovitz on 3/10/21.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlign: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationlabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLbel = GFBodyLabel(textAlign: .left)
    
    var user: User!

    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElemens()
    }
    
    func configureUIElemens() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? "Not available"
        locationlabel.text = user.location ?? "No location"
        bioLbel.text = user.bio ?? "No bio available"
        bioLbel.numberOfLines = 3
        
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }
    
    func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationlabel)
        view.addSubview(bioLbel)
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textimagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textimagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textimagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textimagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationlabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationlabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationlabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLbel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textimagePadding),
            bioLbel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLbel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLbel.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
