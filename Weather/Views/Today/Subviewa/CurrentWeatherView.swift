//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {
    
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
        backgroundColor = .red
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
    }
    
}

// MARK: - Layout & constraints
extension CurrentWeatherView {
    
    private struct Layout {
    }
    
    private func addSubviews() {
    }
    
}
