//
//  GetLinkHistoryUseCase.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class GetLinkHistoryUseCase {

    private let getLinkHistoryRepository: GetLinkHistoryRepository

    init(getLinkHistoryRepository: GetLinkHistoryRepository) {
        self.getLinkHistoryRepository = getLinkHistoryRepository
    }

    func execute(
        _ onCompletion: @escaping ([HistoricalLinkEntity]) -> Void
    ) {
        getLinkHistoryRepository.getLinkHistory(onCompletion: { linkHistory in
            onCompletion(linkHistory)
        })
    }
}
