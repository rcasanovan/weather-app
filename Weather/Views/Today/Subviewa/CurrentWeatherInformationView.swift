//
//  CurrentWeatherInformationView.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class CurrentWeatherInformationView: UIView {
    
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
extension CurrentWeatherInformationView {
    
    public var height: CGFloat {
        return 200.0
    }
    
    private func setupViews() {
        backgroundColor = .yellow
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
    }
    
}

// MARK: - Layout & constraints
extension CurrentWeatherInformationView {
    
    private struct Layout {
    }
    
    private func addSubviews() {
    }
    
}
