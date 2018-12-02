//
//  TodayViewController.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class TodayViewController: BaseViewController {
    
    public var presenter: TodayPresenterDelegate?
    
    private let scrollView: UIScrollView = UIScrollView()
    /**
     * The ContentView is child of ScrollView, and it has the size of the screen
     * https://www.natashatherobot.com/ios-autolayout-scrollview/
     */
    private let contentView = UIView()
    
    private let currentWeatherView: CurrentWeatherView = CurrentWeatherView()
    private let currentWeatherInformationView: CurrentWeatherInformationView = CurrentWeatherInformationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
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
        scrollView.backgroundColor = .clear
        scrollView.clipsToBounds = false
        scrollView.alwaysBounceVertical = true
    }
    
    private func configureNavigationBar() {
        let customTitleView = CustomTitleView()
        customTitleView.titleColor = .black
        customTitleView.setTitle(NSLocalizedString("today.title", comment: ""))
        navigationItem.titleView = customTitleView
    }
    
}

// MARK: - Layout & constraints
extension TodayViewController {
    
    private func addSubviews() {
        view.addSubview(scrollView)
        
        let top = showTopSeparator ? 2.0 : 0.0
        view.addConstraintsWithFormat("H:|[v0]|", views: scrollView)
        view.addConstraintsWithFormat("V:|-\(top)-[v0]|", views: scrollView)
        
        // - ContentView added to scrollView
        scrollView.addSubview(contentView)
        scrollView.addConstraintsWithFormat("H:|[v0]|", views: contentView)
        scrollView.addConstraintsWithFormat("V:|[v0]|", views: contentView)
        
        let heightConstraint = NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0)
        heightConstraint.priority = UILayoutPriority.defaultLow
        scrollView.addConstraint(heightConstraint)
        
        let widthConstraint = NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0)
        scrollView.addConstraint(widthConstraint)
        
        contentView.addSubview(currentWeatherView)
        contentView.addConstraintsWithFormat("H:|[v0]|", views: currentWeatherView)
        contentView.addConstraintsWithFormat("V:|[v0(\(currentWeatherView.height))]", views: currentWeatherView)
        
        contentView.addSubview(currentWeatherInformationView)
        contentView.addConstraintsWithFormat("H:|[v0]|", views: currentWeatherInformationView)
        contentView.addConstraintsWithFormat("V:[v0][v1(\(currentWeatherInformationView.height))]", views: currentWeatherView, currentWeatherInformationView)
    }
    
}

extension TodayViewController: TodayViewInjection {
    
    func loadWeatherInformationWithViewModel(_ viewModel: TodayViewModel) {
        currentWeatherView.bindWithViewModel(viewModel)
        currentWeatherInformationView.bindWithViewModel(viewModel)
    }
    
}

