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
        hourLabel.text = viewModel.dt
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
        hourLabel.font = UIFont.proximaNovaLightWithSize(size: 18.0)
        hourLabel.textColor = .black
        
        descriptionLabel.font = UIFont.proximaNovaLightWithSize(size: 18.0)
        descriptionLabel.textColor = .black
        
        tempLabel.font = UIFont.proximaNovaSemiboldWithSize(size: 40.0)
        tempLabel.textColor = UIColor.colorWithHex(hex: "4B92F7")
        tempLabel.textAlignment = .right
    }
    
}

// MARK: - Layout & constraints
extension ForecastTableViewCell {
    
    /**
     * Internal struct for layout
     */
    private struct Layout {
        
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        addSubview(weatherIconImageView)
        addSubview(hourLabel)
        addSubview(descriptionLabel)
        addSubview(tempLabel)
        
        addConstraintsWithFormat("H:|-20.0-[v0(60.0)]", views: weatherIconImageView)
        addConstraintsWithFormat("V:|-14.0-[v0(60.0)]-14.0-|", views: weatherIconImageView)
        
        addConstraintsWithFormat("H:[v0]-14.0-[v1]-14.0-[v2]", views: weatherIconImageView, hourLabel, tempLabel)
        addConstraintsWithFormat("V:|-24.0-[v0(20.0)]", views: hourLabel)
        
        addConstraintsWithFormat("H:[v0]-14.0-[v1]-14.0-[v2]", views: weatherIconImageView, descriptionLabel, tempLabel)
        addConstraintsWithFormat("V:[v0][v1(20.0)]", views: hourLabel, descriptionLabel)
        
        addConstraintsWithFormat("H:[v0(>=0.0)]-14.0-|", views: tempLabel)
        addConstraintsWithFormat("V:|-14.0-[v0]-14.0-|", views: tempLabel)
    }
    
}
