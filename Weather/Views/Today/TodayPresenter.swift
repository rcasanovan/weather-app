//
//  TodayPresenter.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class TodayPresenter {
    
    private weak var view: TodayViewInjection?
    private let interactor: TodayInteractorDelegate
    
    // MARK - Lifecycle
    init(view: TodayViewInjection, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = TodayInteractor()
    }
    
}

extension TodayPresenter: TodayPresenterDelegate {
    
    func viewDidLoad() {
        interactor.requestLocationAuthorizationIfNeeded()
    }
    
}
