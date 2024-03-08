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
    let infoLabel = UILabel()
    let scrollView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        configureScrollView()
        configureLogoImageView()
        configureDateLabel()
        configureInfoLabel()
        print(woman.Name)
    }
    
    func setBackgroundImage() {
        let background = UIImage(named: "DetailBackground")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        //imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        contentView.addSubview(imageView)
        contentView.sendSubviewToBack(imageView)
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: view.heightAnchor)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(250)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func configureLogoImageView() {
        logoImageView.downloadImage(from: woman.LogoUrl)
        contentView.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.layer.borderWidth = 1
        logoImageView.layer.borderColor = UIColor.systemGray.cgColor
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1.5)
        ])
    }
    
    func configureDateLabel() {
        contentView.addSubview(dateLabel)
        dateLabel.text = "\(woman.BornDate) - \(woman.DeadDate)"
        dateLabel.textColor = .black
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)
        dateLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
        
    func configureInfoLabel() {
        contentView.addSubview(infoLabel)
        infoLabel.text = woman.Info
        infoLabel.textColor = .secondaryLabel
        infoLabel.textAlignment = .left
        infoLabel.font = UIFont.preferredFont(forTextStyle: .body)
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            infoLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -20)
        ])
        
    }

}
