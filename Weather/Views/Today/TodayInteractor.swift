//
//  TodayInteractor.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class TodayInteractor {
    
    private let requestManager = RequestManager()
    
}

extension TodayInteractor {
    
    private func getWeatherWith(latitude: CGFloat, longitude: CGFloat, completion: @escaping getWeatherCompletionBlock) {
        var getWeatherRequest = WeatherRequest(latitude: latitude, longitude: longitude)
        
        getWeatherRequest.completion = completion
        requestManager.send(request: getWeatherRequest)
    }
    
}

extension TodayInteractor: TodayInteractorDelegate {
    
    func requestLocationAuthorizationIfNeeded() {
        LocationManager.sharedInstance.requestAuthorizationIfNeeded()
    }
    
    func getCurrentWeather(completion: @escaping getWeatherInteractorCompletionBlock) {
        LocationManager.sharedInstance.simulateLocation = true
        guard let currenLocation = LocationManager.sharedInstance.getCurrentLocation() else {
            completion(nil, false, nil)
            return
        }
        let latitude = CGFloat(currenLocation.latitude)
        let longitude = CGFloat(currenLocation.longitude)
        getWeatherWith(latitude: latitude, longitude: longitude) { (response) in
            switch response {
            case .success(let weather):
                guard let weather = weather else {
                    completion(nil, false, nil)
                    return
                }
                LocalWeatherManager.saveLocalWeather(weather)
                let viewModel = TodayViewModel.getViewModelWith(weatherResponse: weather)
                completion(viewModel, true, nil)
                break
            case .failure(let error):
                completion(nil, false, error)
                break
            }
        }
    }
    
}
