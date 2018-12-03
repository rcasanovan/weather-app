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
    private let temperatureLabel: UILabel = UILabel()
    private let weatherLabel: UILabel = UILabel()
    
    public var height: CGFloat {
        return Layout.height
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public func bindWithViewModel(_ viewModel: TodayViewModel) {
        if let currentWeatherIconName = viewModel.currentWeatherIconName {
            weatherImageView.image = UIImage(named: currentWeatherIconName)
        }
        weatherTitleView.title = viewModel.cityName
        temperatureLabel.text = viewModel.currentTemperature
        weatherLabel.text = viewModel.weatherDescription
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
        temperatureLabel.font = UIFont.proximaNovaRegularWithSize(size: 44.0)
        temperatureLabel.textColor = .dodgerBlue()
        temperatureLabel.textAlignment = .center
        
        weatherLabel.font = UIFont.proximaNovaRegularWithSize(size: 20.0)
        weatherLabel.textColor = .dodgerBlue()
        weatherLabel.textAlignment = .center
    }
    
}

// MARK: - Layout & constraints
extension CurrentWeatherView {
    
    private struct Layout {
        
        static let height: CGFloat = 300.0
        
        struct WeatherImageView {
            static let top: CGFloat = 80.0
            static let width: CGFloat = 100.0
            static let height: CGFloat = 100.0
        }
        
        struct WeatherTitleView {
            static let top: CGFloat = 20.0
            static let width: CGFloat = 300.0
        }
        
        struct TemperatureLabel {
            static let leading: CGFloat = 20.0
            static let trailing: CGFloat = 20.0
            static let top: CGFloat = 10.0
            static let height: CGFloat = 46.0
        }
        
        struct WeatherLabel {
            static let leading: CGFloat = 20.0
            static let trailing: CGFloat = 20.0
        }
        
    }
    
    private func addSubviews() {
        addSubview(weatherImageView)
        addSubview(weatherTitleView)
        addSubview(temperatureLabel)
        addSubview(weatherLabel)
        
        addConstraintsWithFormat("V:|-\(Layout.WeatherImageView.top)-[v0(\(Layout.WeatherImageView.height))]", views: weatherImageView)
        addConstraintsWithFormat("H:[v0(\(Layout.WeatherImageView.width))]", views: weatherImageView)
        let weatherImageViewCenterLayout = NSLayoutConstraint(item: weatherImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        addConstraint(weatherImageViewCenterLayout)
        
        
        addConstraintsWithFormat("V:[v0]-\(Layout.WeatherTitleView.top)-[v1(\(weatherTitleView.height))]", views: weatherImageView, weatherTitleView)
        addConstraintsWithFormat("H:[v0(<=\(Layout.WeatherTitleView.width))]", views: weatherTitleView)
        let weatherTitleViewCenterLayout = NSLayoutConstraint(item: weatherTitleView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        addConstraint(weatherTitleViewCenterLayout)
        
        addConstraintsWithFormat("H:|-\(Layout.TemperatureLabel.leading)-[v0]-\(Layout.TemperatureLabel.trailing)-|", views: temperatureLabel)
        addConstraintsWithFormat("V:[v0]-\(Layout.TemperatureLabel.top)-[v1(\(Layout.TemperatureLabel.height))]", views: weatherTitleView, temperatureLabel)
        
        addConstraintsWithFormat("H:|-\(Layout.WeatherLabel.leading)-[v0]-\(Layout.WeatherLabel.trailing)-|", views: weatherLabel)
        addConstraintsWithFormat("V:[v0][v1]|", views: temperatureLabel, weatherLabel)
        
        
    }
    
}
