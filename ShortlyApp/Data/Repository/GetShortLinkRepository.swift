//
//  GetShortLinkRepository.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

protocol GetShortLinkRepository {
    func getShortLink(
        originalLink: String,
        onCompletion: @escaping (ApiResult, HistoricalLinkEntity) -> Void
    )
}
