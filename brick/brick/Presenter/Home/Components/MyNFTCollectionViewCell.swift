//
//  MyNFTCollectionViewCell.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class MyNFTCollectionViewCell: BaseCollectionViewCell {
    
    let tableView = UITableView()
    
    var nfts: [String] = []
    
    func update(nfts: [String]) {
        self.nfts = nfts
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nfts = []
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        contentView.backgroundColor = .cyan
        
        tableView.register(NFTListTableViewCell.self, forCellReuseIdentifier: String(describing: NFTListTableViewCell.self))
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        contentView.addSubview(tableView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension MyNFTCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nfts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NFTListTableViewCell.self), for: indexPath) as? NFTListTableViewCell else { return UITableViewCell() }
        
        cell.update(title: nfts[indexPath.row])
        return cell
    }
}
