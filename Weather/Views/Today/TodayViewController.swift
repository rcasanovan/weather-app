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
    private let shareButton: UIButton = UIButton(type: .custom)
    
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
        
        shareButton.titleLabel?.font = UIFont.proximaNovaSemiboldWithSize(size: 16.0)
        shareButton.setTitleColor(.orange, for: .normal)
        shareButton.setTitle(NSLocalizedString("share.title", comment: ""), for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
    }
    
    private func configureNavigationBar() {
        let customTitleView = CustomTitleView()
        customTitleView.titleColor = UIColor.colorWithHex(hex: "333333")
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
        
        contentView.addSubview(shareButton)
        contentView.addConstraintsWithFormat("H:[v0(100.0)]", views: shareButton)
        contentView.addConstraintsWithFormat("V:[v0]-40.0-[v1(22.0)]", views: currentWeatherInformationView, shareButton)
        let shareButtonCenterLayout = NSLayoutConstraint(item: shareButton, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        contentView.addConstraint(shareButtonCenterLayout)
    }
    
}

extension TodayViewController {
    
    @objc private func shareButtonPressed() {
        var items: [Any] = [NSLocalizedString("share.message.title", comment: "")]
        
        if let image = Device.takeScreenshot() {
            items.append(image)
        }
        
        ShareManager.shared.share(items, from: self)
    }
    
}

extension TodayViewController: TodayViewInjection {
    
    func loadWeatherInformationWithViewModel(_ viewModel: TodayViewModel) {
        currentWeatherView.bindWithViewModel(viewModel)
        currentWeatherInformationView.bindWithViewModel(viewModel)
    }
    
}

