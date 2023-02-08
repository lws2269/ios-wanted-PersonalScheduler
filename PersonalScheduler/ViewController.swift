//
//  ViewController.swift
//  PersonalScheduler
//
//  Created by kjs on 06/01/23.
//

import UIKit

class ViewController: UIViewController {
    let manager = KaKaoApiManager()
    
    let titleLabel: UILabel = {
      let label = UILabel()
        label.text = "개인 일정관리 앱"
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(#imageLiteral(resourceName: "kakao_login_medium_narrow"), for: [])
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLayout()
        configureAction()
    }
    
    func configureAction() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func configureLayout() {
        view.addSubview(titleLabel)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            
            loginButton.widthAnchor.constraint(equalToConstant: 183),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
        ])
    }
    
    @objc func loginButtonTapped() {
        manager.handleKakaoLogin()
    }
}
