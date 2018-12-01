//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {
    
    private let weatherImageView: UIImageView = UIImageView()
    private let weatherTitleView: WeatherTitleView = WeatherTitleView()
    
    public var height: CGFloat {
        return 300.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
}

// MARK: - Setup views
extension CurrentWeatherView {
    
    private func setupViews() {
        backgroundColor = .white
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        weatherImageView.image = UIImage(named: "ClearSkyDay")
    }
    
}

// MARK: - Layout & constraints
extension CurrentWeatherView {
    
    private struct Layout {
        
        struct WeatherImageView {
            static let top: CGFloat = 80.0
            static let width: CGFloat = 100.0
            static let height: CGFloat = 100.0
        }
        
    }
    
    private func addSubviews() {
        addSubview(weatherImageView)
        addSubview(weatherTitleView)
        
        addConstraintsWithFormat("V:|-\(Layout.WeatherImageView.top)-[v0(\(Layout.WeatherImageView.height))]", views: weatherImageView)
        addConstraintsWithFormat("H:[v0(\(Layout.WeatherImageView.width))]", views: weatherImageView)
        let weatherImageViewCenterLayout = NSLayoutConstraint(item: weatherImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        addConstraint(weatherImageViewCenterLayout)
        
        
        addConstraintsWithFormat("V:[v0]-20.0-[v1(\(weatherTitleView.height))]", views: weatherImageView, weatherTitleView)
        addConstraintsWithFormat("H:[v0(<=300.0)]", views: weatherTitleView)
        let weatherTitleViewCenterLayout = NSLayoutConstraint(item: weatherTitleView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        addConstraint(weatherTitleViewCenterLayout)
        
        
    }
    
}
