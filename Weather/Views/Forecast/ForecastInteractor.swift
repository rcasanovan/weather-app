//
//  ForecastInteractor.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

class ForecastInteractor {
}

extension ForecastInteractor: ForecastInteractorDelegate {
    
    func getWeatherInformation() -> [ForecastViewModel]? {
        guard let weatherResponse = LocalWeatherManager.shared.getLocalWeather() else {
            return nil
        }
        return ForecastViewModel.getViewModelsWith(weatherResponse: weatherResponse)
    }
    
}
