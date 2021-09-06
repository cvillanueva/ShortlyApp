//
//  GetLinkHistoryRepository.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

protocol GetLinkHistoryRepository {
    func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)
}
