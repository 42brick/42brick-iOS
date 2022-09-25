//
//  NFTListTableViewCell.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class NFTListTableViewCell: BaseTableViewCell {
    let id1 = "NFTListTableViewCell1"
    let id2 = "NFTListTableViewCell2"

    let circle = UIView()
    let circleLabel = UILabel()
    let titleLabel = UILabel()
    let detailButton = UIButton()
    
    func update(title: String, order: Int) {
        titleLabel.text = title
        circleLabel.text = "\(order)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        circleLabel.text = ""
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        circle.cornerRound(radius: 12)
        circle.backgroundColor = .systemBlue
        
        circleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        circleLabel.textColor = .white
        circleLabel.textAlignment = .center
        
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        titleLabel.textColor = .black
        
        detailButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        detailButton.tintColor = .black
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        contentView.addSubviews([circle, titleLabel, detailButton])
        
        circle.addSubview(circleLabel)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        circle.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        circleLabel.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(circle.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(20)
        }
        
        detailButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(42)
        }
    }
}
