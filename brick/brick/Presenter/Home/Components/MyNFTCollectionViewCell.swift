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
