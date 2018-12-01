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
    
    public var showTopSeparator: Bool = false {
        didSet {
            topSeparatorImageView.isHidden = !showTopSeparator
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - Setup views
extension BaseViewController {
    
    private func setupViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        topSeparatorImageView.image = UIImage(named: "TopSeparator")
        topSeparatorImageView.isHidden = true
    }
    
}

// MARK: - Layout & constraints
extension BaseViewController {
    
    private struct Layout {
        
        struct TopSeparatorImageView {
            static let height: CGFloat = 2.0
        }
        
    }
    
    private func addSubviews() {
        view.addSubview(topSeparatorImageView)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: topSeparatorImageView)
        view.addConstraintsWithFormat("V:|[v0(\(Layout.TopSeparatorImageView.height))]", views: topSeparatorImageView)
    }
    
}
