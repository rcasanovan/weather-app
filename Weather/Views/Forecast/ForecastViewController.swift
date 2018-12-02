//
//  ForecastViewController.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

class ForecastViewController: BaseViewController {
    
    public var presenter: ForecastPresenterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
    }
    
}

// MARK: - Setup views
extension ForecastViewController {
    
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
        customTitleView.setTitle("Forecast")
        navigationItem.titleView = customTitleView
    }
    
}

// MARK: - Layout & constraints
extension ForecastViewController {
    
    private func addSubviews() {
    }
    
}

extension ForecastViewController: ForecastViewInjection {
    
    func loadWeatherInformationWithViewModel(_ viewModel: TodayViewModel) {
        print("TO DO")
    }
    
}
