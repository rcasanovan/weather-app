//
//  CurrentWeatherInformationView.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit
import CollectionViewCenteredFlowLayout

class CurrentWeatherInformationView: UIView {
    
    private let topSeparatorImageView: UIImageView = UIImageView()
    private let bottomSeparatorImageView: UIImageView = UIImageView()
    private let infoContainerView: UIView = UIView()
    private var infoCollectionView: UICollectionView?
    private var datasource: CurrentWeatherInformationDatasource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public func bindWithViewModel(_ viewModel: TodayViewModel) {
        datasource?.viewModel = viewModel
        infoCollectionView?.reloadData()
    }
    
}

// MARK: - Setup views
extension CurrentWeatherInformationView {
    
    public var height: CGFloat {
        return 200.0
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        topSeparatorImageView.image = UIImage(named: "SeparatorLine")
        bottomSeparatorImageView.image = UIImage(named: "SeparatorLine")
        
        infoContainerView.backgroundColor = .clear
        let flowLayout = CollectionViewCenteredFlowLayout()
        flowLayout.scrollDirection = .vertical
        infoCollectionView = UICollectionView(frame: infoContainerView.bounds, collectionViewLayout: flowLayout)
        infoCollectionView?.backgroundColor = .clear
        infoCollectionView?.isUserInteractionEnabled = true
        infoCollectionView?.showsVerticalScrollIndicator = false
        infoCollectionView?.delegate = self
        registerCells()
        setupDatasource()
    }
    
    private func registerCells() {
        infoCollectionView?.register(CurrentWeatherInformationCollectionViewCell.self, forCellWithReuseIdentifier: CurrentWeatherInformationCollectionViewCell.identifier)
    }
    
    private func setupDatasource() {
        if let infoCollectionView = infoCollectionView {
            datasource = CurrentWeatherInformationDatasource()
            infoCollectionView.dataSource = datasource
        }
    }
    
}

// MARK: - Layout & constraints
extension CurrentWeatherInformationView {
    
    private struct Layout {
        
        struct CollectionViewCell {
            static let centerSpacing: CGFloat = 20.0
            static let edgeSpacingTop: CGFloat = 20.0
            static let edgeSpacingLeft: CGFloat = 20.0
            static let edgeSpacingBottom: CGFloat = 20.0
            static let edgeSpacingRight: CGFloat = 20.0
        }
        
        struct SeparatorImageView {
            static let width: CGFloat = 111.0
            static let height: CGFloat = 1.0
            static let top: CGFloat = 30.0
        }
        
        struct InfoContainerView {
            static let width: CGFloat = 320.0
        }
        
    }
    
    private func addSubviews() {
        addSubview(topSeparatorImageView)
        addSubview(bottomSeparatorImageView)
        addSubview(infoContainerView)
        
        addConstraintsWithFormat("H:[v0(\(Layout.SeparatorImageView.width))]", views: topSeparatorImageView)
        addConstraintsWithFormat("V:|-\(Layout.SeparatorImageView.top)-[v0(\(Layout.SeparatorImageView.height))]", views: topSeparatorImageView)
        let topSeparatorCenterLayout = NSLayoutConstraint(item: topSeparatorImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        addConstraint(topSeparatorCenterLayout)
        
        addConstraintsWithFormat("H:[v0(\(Layout.SeparatorImageView.width))]", views: bottomSeparatorImageView)
        addConstraintsWithFormat("V:[v0(\(Layout.SeparatorImageView.height))]|", views: bottomSeparatorImageView)
        let bottomSeparatorCenterLayout = NSLayoutConstraint(item: bottomSeparatorImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        addConstraint(bottomSeparatorCenterLayout)
        
        addConstraintsWithFormat("H:[v0(\(Layout.InfoContainerView.width))]", views: infoContainerView)
        addConstraintsWithFormat("V:[v0][v1][v2]", views: topSeparatorImageView, infoContainerView, bottomSeparatorImageView)
        let infoContainerCenterLayout = NSLayoutConstraint(item: infoContainerView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        addConstraint(infoContainerCenterLayout)
        
        if let infoCollectionView = infoCollectionView {
            infoContainerView.addSubview(infoCollectionView)
            infoContainerView.addConstraintsWithFormat("H:|[v0]|", views: infoCollectionView)
            infoContainerView.addConstraintsWithFormat("V:|[v0]|", views: infoCollectionView)
        }
    }
    
}

// MARK:- UICollectionViewDelegate (with UICollectionViewDelegateFlowLayout)
extension CurrentWeatherInformationView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CurrentWeatherInformationCollectionViewCell.getSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Layout.CollectionViewCell.edgeSpacingTop, left: Layout.CollectionViewCell.edgeSpacingLeft, bottom: Layout.CollectionViewCell.edgeSpacingBottom, right: Layout.CollectionViewCell.edgeSpacingRight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.CollectionViewCell.centerSpacing
    }
    
}
