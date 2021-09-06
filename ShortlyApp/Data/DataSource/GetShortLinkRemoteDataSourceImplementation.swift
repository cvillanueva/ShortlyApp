//
//  GetShortLinkRemoteDataSourceImplementation.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

// swiftlint:disable type_name
final class GetShortLinkRemoteDataSourceImplementation: GetShortLinkRemoteDataSource {

    private enum Constants {
        static let url = "https://api.shrtco.de/v2/shorten?url="
    }

    private let manager: NetworkManager

    init (manager: NetworkManager) {
        self.manager = manager
    }

    func getShortLink(
        originalLink: String,
        onCompletion: @escaping (ApiShortenResponse) -> Void
    ) {
        let fullUrl = Constants.url + originalLink
        manager.request(url: fullUrl, onCompletion: { result in
            onCompletion(result)
        })
    }
}
