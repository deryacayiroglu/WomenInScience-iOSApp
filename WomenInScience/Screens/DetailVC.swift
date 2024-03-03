//
//  DetailVC.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 2.03.2024.
//

import UIKit

class DetailVC: UIViewController {
    
    var woman: Woman!
    
    let logoImageView = LogoImageView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        configureLogoImageView()
        print(woman.Adi)
    }
    
    func setBackgroundImage() {
        let background = UIImage(named: "DetailBackground")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func configureLogoImageView() {
        logoImageView.downloadImage(from: woman.LogoUrl)
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.layer.borderWidth = 1
        logoImageView.layer.borderColor = UIColor.systemGray.cgColor
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1.5)
        ])
    }

}
