//
//  CacheManager.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

protocol CacheManager {
    func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool
    func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)
}
