//
//  ListVC.swift
//  WomenInScience
//
//  Created by Derya Çayıroğlu on 22.02.2024.
//

import UIKit

class ListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var womenInScience: [Woman] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Woman>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getWomenInScience()
        configureDataSource()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowlayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(WomanCell.self, forCellWithReuseIdentifier: WomanCell.reuseID)
    }
    
    func getWomenInScience() {
        NetworkManager.shared.getWomenInScience { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let womenInScience):
                self.womenInScience = womenInScience
                self.updateData()
                print(womenInScience)
                
            case .failure(let error):
                print("Bad Stuff Happend")
            }
            
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Woman>(collectionView: collectionView, cellProvider: {
            (collectionView, indexPath, woman) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WomanCell.reuseID, for: indexPath) as! WomanCell
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Woman>()
        snapshot.appendSections([.main])
        snapshot.appendItems(womenInScience)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
        
    }
    
}
