//
//  GetShortLinkRepositoryTests.swift
//  ShortlyAppTests
//
//  Created by Claudio Villanueva on 06-09-21.
//

@testable import ShortlyApp
import XCTest
import Cuckoo

final class GetShortLinkRepositoryTests: XCTestCase {

    private var sut: GetShortLinkRepositoryImplementation!
    private var remote = MockGetShortLinkRemoteDataSource()
    private let mapper = MockShortLinkMapper()
    private let apiShortenResponse = ApiShortenResponse.make()
    private let originalLink = UUID().uuidString
    private let expectedResult = (ApiResult.make(), HistoricalLinkEntity.make())

    override func setUp() {
        sut = GetShortLinkRepositoryImplementation(
            remoteDataSource: remote,
            mapper: mapper
        )
        stub(remote) { stub in
            when(stub.getShortLink(
                originalLink: originalLink,
                onCompletion: any(((ApiShortenResponse) -> Void).self)
            )).thenDoNothing()
        }
        stub(mapper) { stub in
            when(stub.dataToDomain(any())).thenReturn(expectedResult.1)
        }
    }

    func test_getShortLink() {
        // Arrange
        let captor = ArgumentCaptor<(ApiShortenResponse) -> Void>()
        var executionResult: (ApiResult, HistoricalLinkEntity)!

        // Act
        sut.getShortLink(
            originalLink: originalLink,
            onCompletion: { apiResult, response in
                executionResult = (apiResult, response)
        })

        // Assert
        verify(remote).getShortLink(
            originalLink: originalLink,
            onCompletion: captor.capture()
        )
        captor.value?(apiShortenResponse)
        XCTAssert(executionResult.1.originalLink.isEqual(executionResult.1.originalLink))
    }
}
