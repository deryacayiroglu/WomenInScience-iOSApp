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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowlayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(WomanCell.self, forCellWithReuseIdentifier: WomanCell.reuseID)
    }
    
    func getWomenInScience() {
        NetworkManager.shared.getWomenInScience { result in
            
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
    
    func createTwoColumnFlowlayout() -> UICollectionViewFlowLayout {
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
