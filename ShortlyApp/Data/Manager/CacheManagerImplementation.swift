//
//  CacheManagerImplementation.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class CacheManagerImplementation: CacheManager {

    private enum Keys {
        static let linkHistory = "link_history"
    }

    private let defaults = UserDefaults.standard

    func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(linkHistory) {
            defaults.set(encoded, forKey: Keys.linkHistory)
            if defaults.synchronize() {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }

    func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void) {
        if let savedLinkHistory = defaults.object(forKey: Keys.linkHistory) as? Data {
            let decoder = JSONDecoder()
            if let loadedLinkHistory = try? decoder.decode([HistoricalLinkEntity].self, from: savedLinkHistory) {
                onCompletion(loadedLinkHistory)
            } else {
                onCompletion([HistoricalLinkEntity]())
            }
        } else {
            onCompletion([HistoricalLinkEntity]())
        }
    }
}
