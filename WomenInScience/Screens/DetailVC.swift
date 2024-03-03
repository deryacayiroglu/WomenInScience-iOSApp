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
    let dateLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        configureLogoImageView()
        configureDateLabel()
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
    
    func configureDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.text = "\(woman.DogumTarihi) - \(woman.OlumTarihi)"
        dateLabel.textColor = .black
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)
        dateLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
