//
//  GetShortLinkRepositoryImplementation.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

final class GetShortLinkRepositoryImplementation: GetShortLinkRepository {

    private let remoteDataSource: GetShortLinkRemoteDataSource
    private let mapper: ShortLinkMapper

    init(
        remoteDataSource: GetShortLinkRemoteDataSource,
        mapper: ShortLinkMapper
    ) {
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }

    func getShortLink(originalLink: String, onCompletion: @escaping (ApiResult, HistoricalLinkEntity) -> Void) {
        remoteDataSource.getShortLink(originalLink: originalLink, onCompletion: { [weak self] response in
            onCompletion(
                ApiResult(
                    validResult: response.validResponse,
                    errorCode: response.errorCode ?? 0,
                    error: response.error ?? L10n.Label.homeErrorAlertMessageUnknown
                ),
                self?.mapper.dataToDomain(response) ?? HistoricalLinkEntity.make()
            )
        })
    }
}
