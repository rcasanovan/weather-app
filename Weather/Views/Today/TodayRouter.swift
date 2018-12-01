//
//  TodayRouter.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class TodayRouter {
    
    public static func setupModule(navigationController: UINavigationController? = nil) -> TodayViewController {
        let todayVC = TodayViewController()
        todayVC.presenter = TodayPresenter(view: todayVC, navigationController: navigationController)
        return todayVC
    }
    
}

extension TodayRouter: TodayRouterDelegate {
    
}
