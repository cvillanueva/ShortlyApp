//
//  ShortLinkMapper.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

protocol ShortLinkMapper {
    func dataToDomain(_ apiShortenResponse: ApiShortenResponse) -> HistoricalLinkEntity
}
