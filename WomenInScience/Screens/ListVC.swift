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
    var filteredWomen: [Woman] = []
    var isSearching = false
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Woman>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getWomenInScience()
        configureDataSource()
        configureSearchController()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        //navigationController?.isNavigationBarHidden = true
        navigationItem.hidesBackButton = true
        navigationItem.backButtonTitle = "Back"
        title = "Women In Science"
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowlayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(WomanCell.self, forCellWithReuseIdentifier: WomanCell.reuseID)
    }
    
    func getWomenInScience() {
        NetworkManager.shared.getWomenInScience { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let womenInScience):
                self.womenInScience = womenInScience
                self.updateData(on: womenInScience)
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
            cell.set(woman: woman)
            return cell
        })
    }
    
    func updateData(on women: [Woman]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Woman>()
        snapshot.appendSections([.main])
        snapshot.appendItems(women)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
        
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}

extension ListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredWomen : womenInScience
        let woman = activeArray[indexPath.item]
        
        let destVC = DetailVC()
        destVC.woman = woman
        navigationController?.pushViewController(destVC, animated: true)
    }
}

extension ListVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        filteredWomen = womenInScience.filter { $0.Adi.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredWomen)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: womenInScience)
    }
    
}
