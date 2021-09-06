//
//  HistoricalLinkEntity.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

struct HistoricalLinkEntity: Codable, Equatable {
    let code: String
    let originalLink: String
    let shortLink: String

    // Factory
    static func make() -> Self {
        HistoricalLinkEntity(
            code: UUID().uuidString,
            originalLink: UUID().uuidString,
            shortLink: UUID().uuidString
        )
    }

    func isEqual(_ result: HistoricalLinkEntity?) -> Bool {
        self.code == result?.code &&
        self.originalLink == result?.originalLink &&
        self.shortLink == result?.shortLink
    }
}
