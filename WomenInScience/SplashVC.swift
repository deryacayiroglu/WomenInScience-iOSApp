//
//  ViewController.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 22.02.2024.
//

import UIKit

class SplashVC: UIViewController {
    
    let logoImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        goToNextScreen()
    }

    func configure() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo")
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 400),
            logoImageView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func goToNextScreen() {
        let nextScreen = ListVC()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.navigationController?.pushViewController(nextScreen, animated: true)
        }
    }
}

