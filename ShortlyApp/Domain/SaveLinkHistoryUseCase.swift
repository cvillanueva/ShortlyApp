//
//  SaveLinkHistoryUseCase.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class SaveLinkHistoryUseCase {

    private let saveLinkHistoryRepository: SaveLinkHistoryRepository

    init(saveLinkHistoryRepository: SaveLinkHistoryRepository) {
        self.saveLinkHistoryRepository = saveLinkHistoryRepository
    }

    func execute(
        linkHistory: [HistoricalLinkEntity],
        _ onCompletion: @escaping (Bool) -> Void
    ) {
        onCompletion(saveLinkHistoryRepository.saveLinkHistory(linkHistory: linkHistory))
    }
}
