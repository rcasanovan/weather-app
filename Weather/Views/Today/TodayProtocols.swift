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
    func loadWeatherInformationWithViewModel(_ viewModel: TodayViewModel)
    func showMessageWith(title: String, message: String, actionTitle: String)
}

protocol TodayPresenterDelegate : class {
    func viewDidLoad()
    func viewDidAppear()
}

// Presenter / Interactor
typealias getWeatherInteractorCompletionBlock = (_ viewModel: TodayViewModel?, _ success: Bool, _ error: ResultError?) -> Void

protocol TodayInteractorDelegate : class {
    func requestLocationAuthorizationIfNeeded()
    func getCurrentWeather(completion: @escaping getWeatherInteractorCompletionBlock)
    func getLocalWeatherInformation() -> TodayViewModel?
    func shouldGetLocalWeatherInformation() -> Bool
    func shouldGetRemoteWeatherInformation() -> Bool
}
