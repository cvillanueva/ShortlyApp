//
//  Injection.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 02-09-21.
//

import Foundation
import Swinject

final class Injection {
    static let shared = Injection()

    private let container = Container()
    private let mainModule: MainModule

    private init() {
        mainModule = MainModule(container)
        injectDependencies()
    }

    private func injectDependencies() {
        mainModule.inject()
    }

    /// Returns initial screen for SceneDelegate
    /// - Returns: A UIViewController
    func getHomeController() -> UIViewController {
        mainModule.getHomeViewController()
    }
}

// To resolve services as no optionals, and throw an error for unresolved ones.
extension Resolver {
    func resolve<Service>(_ serviceType: Service.Type, name: String? = nil) -> Service {
        guard let service = resolve(serviceType, name: name) else {
            fatalError("The service \(String(describing: Service.self)) has not been registered!")
        }
        return service
    }
}
