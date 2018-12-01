//
//  TodayViewController.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

class TodayViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - Setup views
extension TodayViewController {
    
    private func setupViews() {
        view.backgroundColor = .white
        showTopSeparator = true
        
        configureNavigationBar()
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
    }
    
    private func configureNavigationBar() {
        let customTitleView = CustomTitleView()
        customTitleView.titleColor = .black
        customTitleView.setTitle("Today")
        navigationItem.titleView = customTitleView
    }
    
}

// MARK: - Layout & constraints
extension TodayViewController {
    
    private func addSubviews() {
    }
    
}

