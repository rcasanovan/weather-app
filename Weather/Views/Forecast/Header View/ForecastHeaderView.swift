//
//  ForecastHeaderView.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class ForecastHeaderView: UIView {
    
    private let topSeparatorImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let bottomSeparatorImageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    public static var height: CGFloat {
        return 40.0
    }
    
}

// MARK: - Setup views
extension ForecastHeaderView {
    
    public var height: CGFloat {
        return 20.0
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        topSeparatorImageView.image = UIImage(named: "SeparatorLine")
        titleLabel.font = UIFont.proximaNovaLightWithSize(size: 16.0)
        titleLabel.textColor = .black
        bottomSeparatorImageView.image = UIImage(named: "SeparatorLine")
    }
    
}

// MARK: - Layout & constraints
extension ForecastHeaderView {
    
    private struct Layout {
    }
    
    private func addSubviews() {
        addSubview(topSeparatorImageView)
        addSubview(titleLabel)
        addSubview(bottomSeparatorImageView)
        
        addConstraintsWithFormat("H:|[v0]|", views: topSeparatorImageView)
        addConstraintsWithFormat("V:|[v0(1.0)]", views: topSeparatorImageView)
        
        addConstraintsWithFormat("H:|-14.0-[v0]-14.0-|", views: titleLabel)
        addConstraintsWithFormat("V:|[v0]|", views: titleLabel)
        
        addConstraintsWithFormat("H:|[v0]|", views: bottomSeparatorImageView)
        addConstraintsWithFormat("V:[v0(1.0)]|", views: bottomSeparatorImageView)
    }
    
}

