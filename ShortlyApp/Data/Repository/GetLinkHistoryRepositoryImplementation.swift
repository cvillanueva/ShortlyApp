//
//  GetLinkHistoryRepositoryImplementation.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class GetLinkHistoryRepositoryImplementation: GetLinkHistoryRepository {

    private let localDataSource: LinkLocalDataSource

    init(localDataSource: LinkLocalDataSource) {
        self.localDataSource = localDataSource
    }

    func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void) {
        localDataSource.getLinkHistory(onCompletion: { linkHistory in
            onCompletion(linkHistory)
        })
    }
}
