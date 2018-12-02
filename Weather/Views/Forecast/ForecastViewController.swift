//
//  ForecastViewController.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class ForecastViewController: BaseViewController {
    
    public var presenter: ForecastPresenterDelegate?
    
    private let weatherListContainerView: UIView = UIView()
    private var weatherListTableView: UITableView?
    private var datasource: ForecastDatasource?
    
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
        customTitleView.setTitle(NSLocalizedString("forecast.title", comment: ""))
        navigationItem.titleView = customTitleView
        
        weatherListTableView = UITableView(frame: weatherListContainerView.bounds, style: .plain)
        weatherListTableView?.tableFooterView = UIView()
        weatherListTableView?.estimatedRowHeight = 88.0
        weatherListTableView?.rowHeight = UITableView.automaticDimension
        weatherListTableView?.invalidateIntrinsicContentSize()
        weatherListTableView?.allowsSelection = false
        weatherListTableView?.backgroundColor = .clear
        
        registerCells()
        setupDatasource()
    }
    
    private func registerCells() {
        weatherListTableView?.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.identifier)
    }
    
    private func setupDatasource() {
        if let weatherListTableView = weatherListTableView {
            datasource = ForecastDatasource()
            weatherListTableView.dataSource = datasource
            weatherListTableView.delegate = datasource
        }
    }
    
}

// MARK: - Layout & constraints
extension ForecastViewController {
    
    private func addSubviews() {
        view.addSubview(weatherListContainerView)
        
        let top = showTopSeparator ? 2.0 : 0.0
        view.addConstraintsWithFormat("H:|[v0]|", views: weatherListContainerView)
        view.addConstraintsWithFormat("V:|-\(top)-[v0]|", views: weatherListContainerView)
        
        if let weatherListTableView = weatherListTableView {
            weatherListContainerView.addSubview(weatherListTableView)
            weatherListContainerView.addConstraintsWithFormat("H:|[v0]|", views: weatherListTableView)
            weatherListContainerView.addConstraintsWithFormat("V:|[v0]|", views: weatherListTableView)
        }
    }
    
}

extension ForecastViewController: ForecastViewInjection {
    
    func loadWeatherInformationWithViewModels(_ viewModels: [ForecastViewModel]) {
        datasource?.items = viewModels
        weatherListTableView?.reloadData()
    }
    
}
