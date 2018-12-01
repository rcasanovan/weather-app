//
//  BaseViewController.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let topSeparatorImageView: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Setup views
extension BaseViewController {
    
    private func setupViews() {
        view.backgroundColor = .white
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        topSeparatorImageView.image = UIImage(named: "TopSeparator")
    }
    
}

// MARK: - Layout & constraints
extension BaseViewController {
    
    private func addSubviews() {
        view.addSubview(topSeparatorImageView)
    }
    
}
