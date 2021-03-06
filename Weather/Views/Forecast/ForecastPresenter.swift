//
//  ForecastPresenter.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class ForecastPresenter {
    
    private weak var view: ForecastViewInjection?
    private let interactor: ForecastInteractorDelegate
    
    // MARK - Lifecycle
    init(view: ForecastViewInjection, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = ForecastInteractor()
    }
    
}

// MARK: - Private section
extension ForecastPresenter {
    
    private func getLocalWeatherInformation() {
        guard let viewModels = interactor.getWeatherInformation() else {
            return
        }
        view?.loadWeatherInformationWithViewModels(viewModels)
    }
    
}

// MARK: - ForecastPresenterDelegate
extension ForecastPresenter: ForecastPresenterDelegate {
    
    func viewDidDidAppear() {
        getLocalWeatherInformation()
    }
    
}
