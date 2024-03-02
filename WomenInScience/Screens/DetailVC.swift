//
//  DetailVC.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 2.03.2024.
//

import UIKit

class DetailVC: UIViewController {
    
    var woman: Woman!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print(woman.Adi)
    }

}
