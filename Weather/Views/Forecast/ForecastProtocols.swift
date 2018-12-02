//
//  ForecastProtocols.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

// View / Presenter
protocol ForecastViewInjection : class {
}

protocol ForecastPresenterDelegate : class {
    func viewDidLoad()
}

// Presenter / Interactor
protocol ForecastInteractorDelegate : class {
}

// Presenter / Router
protocol ForecastRouterDelegate : class {
}
