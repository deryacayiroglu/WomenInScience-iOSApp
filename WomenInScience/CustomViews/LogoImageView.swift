//
//  LogoImageView.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 25.02.2024.
//

import UIKit

class LogoImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "logo")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
