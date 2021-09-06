//
//  ShortLinkMapperImplementation.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class ShortLinkMapperImplementation: ShortLinkMapper {
    func dataToDomain(_ apiShortenResponse: ApiShortenResponse) -> HistoricalLinkEntity {
        HistoricalLinkEntity(
            code: apiShortenResponse.result?.code ?? "",
            originalLink: apiShortenResponse.result?.originalLink ?? "",
            shortLink: apiShortenResponse.result?.fullShareLink ?? ""
        )
    }
}
