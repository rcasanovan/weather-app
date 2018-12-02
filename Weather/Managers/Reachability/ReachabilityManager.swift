//
//  ReachabilityManager.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation
import Reachability

class ReachabilityManager: NSObject {
    
    public var reachability: Reachability?
    
    // Create a singleton instance
    static let shared: ReachabilityManager = { return ReachabilityManager() }()
    
    
    override init() {
        super.init()
        
        // Initialise reachability
        reachability = Reachability()
        
        // Register an observer for the network status
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            // Start the network status notifier
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
    }
    
    static func stopNotifier() -> Void {
        do {
            // Stop the network status notifier
            try (ReachabilityManager.shared.reachability)?.startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    
    // Network is reachable
    static func isReachable(completed: @escaping (ReachabilityManager) -> Void) {
        if (ReachabilityManager.shared.reachability)?.connection != .none {
            completed(ReachabilityManager.shared)
        }
    }
    
    // Network is unreachable
    static func isUnreachable(completed: @escaping (ReachabilityManager) -> Void) {
        if (ReachabilityManager.shared.reachability)?.connection == .none {
            completed(ReachabilityManager.shared)
        }
    }
    
    // Network is reachable via WWAN/Cellular
    static func isReachableViaWWAN(completed: @escaping (ReachabilityManager) -> Void) {
        if (ReachabilityManager.shared.reachability)?.connection == .cellular {
            completed(ReachabilityManager.shared)
        }
    }
    
    // Network is reachable via WiFi
    static func isReachableViaWiFi(completed: @escaping (ReachabilityManager) -> Void) {
        if (ReachabilityManager.shared.reachability)?.connection == .wifi {
            completed(ReachabilityManager.shared)
        }
    }
    
}
