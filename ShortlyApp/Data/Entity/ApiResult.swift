//
//  ApiResult.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 06-09-21.
//

import Foundation

struct ApiResult: Equatable {
    let validResult: Bool
    let errorCode: Int
    let error: String

    static func make() -> Self {
        ApiResult(
            validResult: Bool.random(),
            errorCode: Int.random(in: 0...10),
            error: UUID().uuidString
        )
    }

    func isEqual(_ result: ApiResult?) -> Bool {
        self.validResult == result?.validResult &&
        self.errorCode == result?.errorCode &&
        self.error == result?.error
    }
}
