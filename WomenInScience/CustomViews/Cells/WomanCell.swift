//
//  WomanCell.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 25.02.2024.
//

import UIKit

class WomanCell: UICollectionViewCell {
    static let reuseID = "WomanCell"
    let logoImageview = LogoImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(logoImageview)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            logoImageview.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            logoImageview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            logoImageview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            logoImageview.heightAnchor.constraint(equalTo: logoImageview.widthAnchor, multiplier: 1.5)
        ])
    }
}
