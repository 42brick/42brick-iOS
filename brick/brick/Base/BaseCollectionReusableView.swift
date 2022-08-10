//
//  BaseCollectionReusableView.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class BaseCollectionReusableView: UICollectionReusableView, BaseViewProtocol {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupProperty()
        setupHierarchy()
        setupLayout()
        setupBind()
    }
    
    func setupProperty() { }
    
    func setupHierarchy() { }
    
    func setupLayout() { }
    
    func setupBind() { }
}
