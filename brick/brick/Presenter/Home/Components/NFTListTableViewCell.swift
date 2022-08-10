//
//  NFTListTableViewCell.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class NFTListTableViewCell: BaseTableViewCell {
    
    let titleLabel = UILabel()
    
    func update(title: String) {
        titleLabel.text = title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
    }
    
    override func setupProperty() {
        super.setupProperty()
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        contentView.addSubview(titleLabel)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
