//
//  TodayInteractor.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

class TodayInteractor {
}

extension TodayInteractor: TodayInteractorDelegate {
    
    func requestLocationAuthorizationIfNeeded() {
        LocationManager.sharedInstance.requestAuthorizationIfNeeded()
    }
    
}
