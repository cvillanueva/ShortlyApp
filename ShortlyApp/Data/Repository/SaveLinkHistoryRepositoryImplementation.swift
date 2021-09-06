//
//  SaveLinkHistoryRepositoryImplementation.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class SaveLinkHistoryRepositoryImplementation: SaveLinkHistoryRepository {

    private let localDataSource: LinkLocalDataSource

    init(localDataSource: LinkLocalDataSource) {
        self.localDataSource = localDataSource
    }

    func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool {
        localDataSource.saveLinkHistory(linkHistory: linkHistory)
    }
}
