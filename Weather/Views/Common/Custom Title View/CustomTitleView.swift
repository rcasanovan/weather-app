//
//  CustomTitleView.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class CustomTitleView: UIView {
    
    private var contentStackView = UIStackView()
    private var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewConfig()
        addViewsConfig()
        layoutViewsConfig()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    public var titleColor: UIColor? {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    private func viewConfig() {
        contentStackView.axis = .vertical
        contentStackView.alignment = .center
        contentStackView.distribution  = .fill
        contentStackView.spacing = 5
        
        backgroundColor = .clear
        titleLabel.font = UIFont.proximaNovaRegularWithSize(size: 18.0)
        titleLabel.textColor = .white
    }
    
    private func addViewsConfig() {
        contentStackView.addArrangedSubview(titleLabel)
        addSubview(contentStackView)
    }
    
    private func layoutViewsConfig(){
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0).isActive = true
        contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
    }
    
}
