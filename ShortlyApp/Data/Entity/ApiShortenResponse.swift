//
//  ApiShortenResponse.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

struct ApiShortenResponse: Codable {
    let validResponse: Bool
    let result: ApiShortenResult?
    let errorCode: Int?
    let error: String?

    enum CodingKeys: String, CodingKey {
        case validResponse = "ok"
        case result = "result"
        case errorCode = "error_code"
        case error = "error"
    }

    func isEqual(_ result: ApiShortenResponse?) -> Bool {
        self.validResponse == result?.validResponse &&
        self.result == result?.result
    }

    static func make() -> Self {
        ApiShortenResponse(
            validResponse: Bool.random(),
            result: ApiShortenResult.make(),
            errorCode: 0,
            error: ""
        )
    }
}

struct ApiShortenResult: Codable, Equatable {
    let code: String
    let shortLink: String
    let fullShortLink: String
    let shortLink2: String
    let fullShortLink2: String
    let shortLink3: String
    let fullShortLink3: String
    let shareLink: String
    let fullShareLink: String
    let originalLink: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case shortLink = "short_link"
        case fullShortLink = "full_short_link"
        case shortLink2 = "short_link2"
        case fullShortLink2 = "full_short_link2"
        case shortLink3 = "short_link3"
        case fullShortLink3 = "full_short_link3"
        case shareLink = "share_link"
        case fullShareLink = "full_share_link"
        case originalLink = "original_link"
    }
    
    static func make() -> Self {
        ApiShortenResult(
            code: UUID().uuidString,
            shortLink: UUID().uuidString,
            fullShortLink: UUID().uuidString,
            shortLink2: UUID().uuidString,
            fullShortLink2: UUID().uuidString,
            shortLink3: UUID().uuidString,
            fullShortLink3: UUID().uuidString,
            shareLink: UUID().uuidString,
            fullShareLink: UUID().uuidString,
            originalLink: UUID().uuidString
        )
    }
}
