//
//  MainModule.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 02-09-21.
//

import Foundation
import Swinject
import Alamofire

// swiftlint:disable function_body_length
final class MainModule {
    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    /// Registers classes
    func inject() {
        container.register(Coordinator.self) { _ in
            Coordinator(container: self.container)
        }

        container.register(UINavigationController.self) { resolver in
            UINavigationController(
                rootViewController: resolver.resolve(HomeViewController.self)
            )
        }

        container.register(Session.self) { _ in
            AF
        }

        container.register(NetworkManager.self) { resolver in
            NetworkManagerImplementation(
                alamofire: resolver.resolve(Session.self)
            )
        }

        container.register(GetShortLinkRemoteDataSource.self) { resolver in
            GetShortLinkRemoteDataSourceImplementation(
                manager: resolver.resolve(NetworkManager.self)
            )
        }

        container.register(ShortLinkMapper.self) { _ in
            ShortLinkMapperImplementation()
        }

        container.register(CacheManager.self) { _ in
            CacheManagerImplementation()
        }

        container.register(LinkLocalDataSource.self) { resolver in
            LinkLocalDataSourceImplementation(
                manager: resolver.resolve(CacheManager.self)
            )
        }

        container.register(GetLinkHistoryRepository.self) { resolver in
            GetLinkHistoryRepositoryImplementation(
                localDataSource: resolver.resolve(LinkLocalDataSource.self)
            )
        }

        container.register(SaveLinkHistoryRepository.self) { resolver in
            SaveLinkHistoryRepositoryImplementation(
                localDataSource: resolver.resolve(LinkLocalDataSource.self)
            )
        }

        container.register(GetLinkHistoryUseCase.self) { resolver in
            GetLinkHistoryUseCase(
                getLinkHistoryRepository: resolver.resolve(GetLinkHistoryRepository.self)
            )
        }

        container.register(GetShortLinkUseCase.self) { resolver in
            GetShortLinkUseCase(
                repository: GetShortLinkRepositoryImplementation(
                    remoteDataSource: resolver.resolve(GetShortLinkRemoteDataSource.self),
                    mapper: resolver.resolve(ShortLinkMapper.self)
                )
            )
        }

        container.register(SaveLinkHistoryUseCase.self) { resolver in
            SaveLinkHistoryUseCase(
                saveLinkHistoryRepository: resolver.resolve(SaveLinkHistoryRepository.self)
            )
        }

        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(
                getLinkHistoryUseCase: resolver.resolve(GetLinkHistoryUseCase.self),
                getShortLinkUseCase: resolver.resolve(GetShortLinkUseCase.self),
                saveLinkHistoryUseCase: resolver.resolve(SaveLinkHistoryUseCase.self)
            )
        }

        container.register(HomeViewController.self) { resolver in
            HomeViewController(
                resolver.resolve(HomeViewModel.self),
                resolver.resolve(Coordinator.self)
            )
        }
    }

    /// Returns initial screen for SceneDelegate
    /// - Returns: A UIViewController
    func getHomeViewController() -> UIViewController {
        container.resolve(HomeViewController.self)
    }
}
