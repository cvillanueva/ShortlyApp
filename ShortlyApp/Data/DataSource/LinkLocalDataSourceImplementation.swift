//
//  LinkLocalDataSourceImplementation.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class LinkLocalDataSourceImplementation: LinkLocalDataSource {

    private let manager: CacheManager

    init(manager: CacheManager) {
        self.manager = manager
    }

    func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool {
        return manager.saveLinkHistory(linkHistory: linkHistory)
    }

    func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void) {
        manager.getLinkHistory(onCompletion: { linkHistory in
            onCompletion(linkHistory)
        })
    }

}
