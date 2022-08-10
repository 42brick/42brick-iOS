//
//  HomeViewController.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class HomeViewController: BaseViewController {
    let homeListHeaderStackView = UIStackView()
    let myNFTHeader = UILabel()
    let homeListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var myNFTs = ["안녕", "나는", "영모", "안녕", "하세요", "이건", "테스트", "ㅎㅇ", "123", "152125"]
    var favoriteNFTs = [1, 2, 3, 4, 5, 6]
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "홈"
    }
    
    override func setupDelegate() {
        super.setupDelegate()
        
        homeListCollectionView.delegate = self
        homeListCollectionView.dataSource = self
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        homeListCollectionView.isPagingEnabled = true
        homeListCollectionView.collectionViewLayout = flowLayout
        homeListCollectionView.register(MyNFTCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: MyNFTCollectionViewCell.self))
        homeListCollectionView.register(FavoriteNFTCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: FavoriteNFTCollectionViewCell.self))
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        view.addSubview(homeListCollectionView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        homeListCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyNFTCollectionViewCell.self), for: indexPath) as? MyNFTCollectionViewCell else { return UICollectionViewCell() }
            
            cell.update(nfts: myNFTs)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FavoriteNFTCollectionViewCell.self), for: indexPath)
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
