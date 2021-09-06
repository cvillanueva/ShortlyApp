//
//  GetShortLinkRemoteDataSource.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

protocol GetShortLinkRemoteDataSource {
    func getShortLink(
        originalLink: String,
        onCompletion: @escaping (ApiShortenResponse) -> Void
    )
}
