//
//  SaveLinkHistoryRepository.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

protocol SaveLinkHistoryRepository {
    func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool
}
