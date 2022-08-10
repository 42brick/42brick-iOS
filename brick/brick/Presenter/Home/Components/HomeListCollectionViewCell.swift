//
//  HomeListCollectionViewCell.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class HomeListCollectionViewCell: BaseCollectionViewCell {
    let tableView = UITableView()
    
    override func setupProperty() {
        super.setupProperty()
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        contentView.addSubview(tableView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
}
