//
//  CurrentWeatherInformationCollectionViewCell.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class CurrentWeatherInformationCollectionViewCell: UICollectionViewCell {
    
    private let iconImageView: UIImageView = UIImageView()
    private let descriptionLabel: UILabel = UILabel()
    
    /**
     * Identifier for reusable cells
     */
    static public var identifier : String {
        return String(describing: self)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        descriptionLabel.text = ""
    }
    
    public func bindWith(image: UIImage?, description: String) {
        iconImageView.image = image
        descriptionLabel.text = description
    }
    
}

// MARK:- Layout & Constraints
extension CurrentWeatherInformationCollectionViewCell {
    
    /**
     * Private struct for internal layout
     */
    private struct Layout {
        
        struct ratio {
            static let width: CGFloat = 156.0
            static let height: CGFloat = 237.0
        }
        
    }
    
    /**
     * Common init method to setup all the components
     */
    private func commonInit() {
        configureView()
        addSubviewsWithConstaints()
    }
    
    /**
     * Configure the elements inside the component
     */
    private func configureView() {
        backgroundColor = .clear
        
        descriptionLabel.font = UIFont.proximaNovaLightWithSize(size: 16.0)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
    }
    
    /**
     * Reset all the content for the cell
     */
    private func resetContent() {
    }
    
    /**
     * Add elements to the view and setup the constraints
     */
    private func addSubviewsWithConstaints() {
        addSubview(iconImageView)
        addSubview(descriptionLabel)
        
        addConstraintsWithFormat("H:[v0(30.0)]", views: iconImageView)
        addConstraintsWithFormat("V:|[v0(30.0)]", views: iconImageView)
        let iconImageCenterLayout = NSLayoutConstraint(item: iconImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        addConstraint(iconImageCenterLayout)
        
        addConstraintsWithFormat("H:|[v0]|", views: descriptionLabel)
        addConstraintsWithFormat("V:[v0]-5.0-[v1(20.0)]", views: iconImageView, descriptionLabel)
    }
    
}
