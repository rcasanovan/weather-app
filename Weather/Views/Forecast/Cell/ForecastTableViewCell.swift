//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    private let weatherIconImageView: UIImageView = UIImageView()
    private let hourLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let tempLabel: UILabel = UILabel()
    
    static public var identifier: String {
        return String(describing: self)
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        weatherIconImageView.image = nil
        hourLabel.text = ""
        descriptionLabel.text = ""
        tempLabel.text = ""
    }
    
    public static var height: CGFloat {
        return Layout.height
    }
    
    /**
     * Bind component
     *
     * - parameters:
     *      -viewModel: ForecastViewModel
     */
    public func bindWithViewModel(_ viewModel: ForecastViewModel) {
        if let icon = viewModel.icon {
            weatherIconImageView.image = UIImage(named: icon)
        }
        tempLabel.text = viewModel.temp
        hourLabel.text = viewModel.hour
        descriptionLabel.text = viewModel.description
    }
}

// MARK: - Setup views
extension ForecastTableViewCell {
    
    /**
     * SetupViews
     */
    private func setupViews() {
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0.0, left: 90.0, bottom: 0.0, right: 0.0)
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     * ConfigureSubviews
     */
    private func configureSubviews() {
        hourLabel.font = UIFont.proximaNovaBoldWithSize(size: 18.0)
        hourLabel.textColor = .weatherBlack()
        
        descriptionLabel.font = UIFont.proximaNovaLightWithSize(size: 18.0)
        descriptionLabel.textColor = .weatherBlack()
        
        tempLabel.font = UIFont.proximaNovaRegularWithSize(size: 44.0)
        tempLabel.textColor = .dodgerBlue()
        tempLabel.textAlignment = .right
    }
    
}

// MARK: - Layout & constraints
extension ForecastTableViewCell {
    
    /**
     * Internal struct for layout
     */
    private struct Layout {
        
        static let height: CGFloat = 88.0
        
        struct WeatherIconImageView {
            static let leading: CGFloat = 20.0
            static let width: CGFloat = 60.0
            static let height: CGFloat = 60.0
            static let top: CGFloat = 14.0
            static let bottom: CGFloat = 14.0
        }
        
        struct HourLabel {
            static let leading: CGFloat = 14.0
            static let trailing: CGFloat = 14.0
            static let height: CGFloat = 20.0
            static let top: CGFloat = 24.0
        }
        
        struct DescriptionLabel {
            static let leading: CGFloat = 14.0
            static let trailing: CGFloat = 14.0
            static let height: CGFloat = 20.0
        }
        
        struct TempLabel {
            static let trailing: CGFloat = 20.0
            static let top: CGFloat = 14.0
            static let bottom: CGFloat = 14.0
        }
        
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        addSubview(weatherIconImageView)
        addSubview(hourLabel)
        addSubview(descriptionLabel)
        addSubview(tempLabel)
        
        addConstraintsWithFormat("H:|-\(Layout.WeatherIconImageView.leading)-[v0(\(Layout.WeatherIconImageView.width))]", views: weatherIconImageView)
        addConstraintsWithFormat("V:|-\(Layout.WeatherIconImageView.top)-[v0(\(Layout.WeatherIconImageView.height))]-\(Layout.WeatherIconImageView.bottom)-|", views: weatherIconImageView)
        
        addConstraintsWithFormat("H:[v0]-\(Layout.HourLabel.leading)-[v1]-\(Layout.HourLabel.trailing)-[v2]", views: weatherIconImageView, hourLabel, tempLabel)
        addConstraintsWithFormat("V:|-\(Layout.HourLabel.top)-[v0(\(Layout.HourLabel.height))]", views: hourLabel)
        
        addConstraintsWithFormat("H:[v0]-\(Layout.DescriptionLabel.leading)-[v1]-\(Layout.DescriptionLabel.trailing)-[v2]", views: weatherIconImageView, descriptionLabel, tempLabel)
        addConstraintsWithFormat("V:[v0][v1(\(Layout.DescriptionLabel.height))]", views: hourLabel, descriptionLabel)
        
        addConstraintsWithFormat("H:[v0(>=0.0)]-\(Layout.TempLabel.trailing)-|", views: tempLabel)
        addConstraintsWithFormat("V:|-\(Layout.TempLabel.top)-[v0]-\(Layout.TempLabel.bottom)-|", views: tempLabel)
    }
    
}
