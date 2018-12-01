//
//  TodayProtocols.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

// View / Presenter
protocol TodayViewInjection : class {
}

protocol TodayPresenterDelegate : class {
    func viewDidLoad()
}

// Presenter / Interactor

protocol TodayInteractorDelegate : class {
    func requestLocationAuthorizationIfNeeded()
}

// Presenter / Router
protocol TodayRouterDelegate : class {
}
