//
//  AppCoordinator.swift
//  Splashy
//
//  Created by Pedro Carrasco on 22/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - PROPERTIES
    var coordinators: [Coordinator] = []
    weak var coordinatorDelegate: CoordinatorDelegate?

    // MARK: - PRIVATE PROPERTIES
    private let navigator: NavigatorRepresentable

    // MARK: - INITIALIZATION
    init(with window: UIWindow, navigator: NavigatorRepresentable) {
        window.rootViewController = navigator.root()
        window.makeKeyAndVisible()

        self.navigator = navigator
    }

    // MARK: - FUNCTIONS
    func start() {
        let homeCoordinator = HomeCoordinator(with: navigator)
        homeCoordinator.coordinatorDelegate = self
        homeCoordinator.start()
    }
}
