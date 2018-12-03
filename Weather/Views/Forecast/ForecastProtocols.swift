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
    func loadWeatherInformationWithViewModels(_ viewModels: [ForecastViewModel])
}

protocol ForecastPresenterDelegate : class {
    func viewDidDidAppear()
}

// Presenter / Interactor
protocol ForecastInteractorDelegate : class {
    func getWeatherInformation() -> [ForecastViewModel]?
}
