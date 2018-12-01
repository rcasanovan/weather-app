//
//  TodayPresenter.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

typealias getWeatherCompletionBlock = (Result<WeatherResponse?>) -> Void

class TodayPresenter {
    
    private weak var view: TodayViewInjection?
    private let interactor: TodayInteractorDelegate
    
    // MARK - Lifecycle
    init(view: TodayViewInjection, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = TodayInteractor()
    }
    
}

extension TodayPresenter {
    
    private func registerInternalNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(locationAllowed), name: .locationAllowed, object: nil)
    }
    
    @objc private func locationAllowed() {
        getCurrentWeatherInformation()
    }
    
    private func getCurrentWeatherInformation() {
        interactor.getCurrentWeather { [weak self] (viewModel, success, error) in
            guard let `self` = self else { return }
            
            if let viewModel = viewModel {
                self.view?.loadWeatherInformationWithViewModel(viewModel)
                return
            }
            
            if let _ = error {
                print("TO DO")
                return
            }
            
            print("TO DO")
        }
    }
    
}

extension TodayPresenter: TodayPresenterDelegate {
    
    func viewDidLoad() {
        registerInternalNotifications()
        interactor.requestLocationAuthorizationIfNeeded()
    }
    
}
