//
//  ForecastRouter.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class ForecastRouter {
    
    public static func setupModule(navigationController: UINavigationController? = nil) -> ForecastViewController {
        let forecastVC = ForecastViewController()
        forecastVC.presenter = ForecastPresenter(view: forecastVC, navigationController: navigationController)
        return forecastVC
    }
    
}
