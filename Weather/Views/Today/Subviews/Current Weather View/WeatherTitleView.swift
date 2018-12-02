//
//  WeatherTitleView.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class WeatherTitleView: UIView {
    
    private let locationArrowImageView: UIImageView = UIImageView()
    private let cityLabel: UILabel = UILabel()
    
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
            cityLabel.text = title
        }
    }
    
}

// MARK: - Setup views
extension WeatherTitleView {
    
    public var height: CGFloat {
        return 20.0
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        locationArrowImageView.image = UIImage(named: "CurrentLocationArrow")
        
        cityLabel.font = UIFont.proximaNovaSemiboldWithSize(size: 17.0)
        cityLabel.textColor = UIColor.colorWithHex(hex: "333333")
    }
    
}

// MARK: - Layout & constraints
extension WeatherTitleView {
    
    private struct Layout {
    }
    
    private func addSubviews() {
        addSubview(locationArrowImageView)
        addSubview(cityLabel)
        
        addConstraintsWithFormat("H:|[v0(12.0)]", views: locationArrowImageView)
        addConstraintsWithFormat("V:|-4.0-[v0(12.0)]", views: locationArrowImageView)
        
        addConstraintsWithFormat("H:[v0]-10.0-[v1]|", views: locationArrowImageView, cityLabel)
        addConstraintsWithFormat("V:|[v0]|", views: cityLabel)
    }
    
}
