//
//  GeneralMessagePresenter.swift
//
//  Created by Ricardo Casanova on 07/09/2018.
//

import Foundation

/**
 * Enum to manage all the possible messages types
 * For now I'm using only NoInternetConnection type but it's possible to extend this in the future
 */
enum GeneralMessageType {
    case NoInternetConnection
}

class GeneralMessagePresenter {
    
    private weak var view: GeneralMessageViewInjection?
    private let type: GeneralMessageType
    
    init(view: GeneralMessageViewInjection, type: GeneralMessageType) {
        self.view = view
        self.type = type
    }
    
}

extension GeneralMessagePresenter: GeneralMessagePresenterDelegate {
    
    /**
     * View did load
     */
    func viewDidLoad() {
        switch type {
        case .NoInternetConnection:
            view?.load(title: NSLocalizedString("general_message.network_no_connection.title", comment: ""), message: NSLocalizedString("general_message.network_no_connection.subtitle", comment: ""))
            break
        }
    }

}
