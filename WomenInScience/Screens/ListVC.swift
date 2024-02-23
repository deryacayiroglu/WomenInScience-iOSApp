//
//  ListVC.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 22.02.2024.
//

import UIKit

class ListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        navigationController?.isNavigationBarHidden = true
        
        NetworkManager.shared.getWomenInScience { (womenInScience, errorMessage) in
            guard let womenInScience = womenInScience else {
                print("Bad Stuff Happend")
                return
            }
            
            print(womenInScience)
        }
    }

}
