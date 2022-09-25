//
//  HomeViewController.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class HomeViewController: BaseViewController {
    let nftListHeaderStackView = UIStackView()
    let myNFTHeader = NFTListHeader(title: "내 NFT")
    let favoriteNFTHeader = NFTListHeader(title: "관심")
    let nftListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var myNFTs = ["안녕", "나는", "영모", "안녕", "하세요", "이건", "테스트", "ㅎㅇ", "123", "152125"]
    var favoriteNFTs = [1, 2, 3, 4, 5, 6]
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "홈"
    }
    
    override func setupDelegate() {
        super.setupDelegate()
        
        nftListCollectionView.delegate = self
        nftListCollectionView.dataSource = self
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        nftListHeaderStackView.axis = .horizontal
        nftListHeaderStackView.distribution = .fillEqually
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        nftListCollectionView.isPagingEnabled = true
        nftListCollectionView.showsVerticalScrollIndicator = false
        nftListCollectionView.showsHorizontalScrollIndicator = false
        nftListCollectionView.collectionViewLayout = flowLayout
        nftListCollectionView.register(MyNFTCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: MyNFTCollectionViewCell.self))
        nftListCollectionView.register(FavoriteNFTCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: FavoriteNFTCollectionViewCell.self))
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        view.addSubviews([nftListHeaderStackView, nftListCollectionView])
        
        nftListHeaderStackView.addArrangedSubview(myNFTHeader)
        nftListHeaderStackView.addArrangedSubview(favoriteNFTHeader)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        nftListHeaderStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
        
        nftListCollectionView.snp.makeConstraints {
            $0.top.equalTo(nftListHeaderStackView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
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
            
            cell.tableView.delegate = self
            cell.tableView.dataSource = self
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNFTs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NFTListTableViewCell.self), for: indexPath) as? NFTListTableViewCell else { return UITableViewCell() }
        
        cell.update(title: myNFTs[indexPath.row], order: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableView)
        print(indexPath)
    }
}
