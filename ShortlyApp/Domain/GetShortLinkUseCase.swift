//
//  GetShortLinkUseCase.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class GetShortLinkUseCase {

    private let repository: GetShortLinkRepository

    init(repository: GetShortLinkRepository) {
        self.repository = repository
    }

    func execute(
        originalLink: String,
        _ onCompletion: @escaping (ApiResult, HistoricalLinkEntity) -> Void
    ) {
        repository.getShortLink(
            originalLink: originalLink,
            onCompletion: { apiResult, linkEntity  in
                onCompletion(apiResult, linkEntity)
        })
    }
}
