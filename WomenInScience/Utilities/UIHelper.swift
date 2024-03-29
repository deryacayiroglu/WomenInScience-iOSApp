//
//  UIHelper.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 28.02.2024.
//

import UIKit

struct UIHelper {
    
    static func createTwoColumnFlowlayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing)
        let itemWidth = availableWidth / 2
                
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
            
        return flowLayout
    }

}
