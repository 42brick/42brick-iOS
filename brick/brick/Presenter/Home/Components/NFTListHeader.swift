//
//  NFTListHeader.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class NFTListHeader: BaseView {
    let titleLabel = UILabel()
    let underLine = UIView()
    
    required init?(coder: NSCoder) {
        fatalError("not supported")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        underLine.backgroundColor = .black
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        addSubviews([titleLabel, underLine])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        underLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
