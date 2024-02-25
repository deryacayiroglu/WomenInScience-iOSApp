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
        
        NetworkManager.shared.getWomenInScience { result in
            
            switch result {
            case .success(let womenInScience):
                print(womenInScience)
                
            case .failure(let error):
                print("Bad Stuff Happend")
            }
            
        }
    }

}
