//
//  GetShortLinkRemoteDataSourceTests.swift
//  ShortlyAppTests
//
//  Created by Claudio Villanueva on 06-09-21.
//

@testable import ShortlyApp
import XCTest
import Cuckoo

final class GetShortLinkRemoteDataSourceTests: XCTestCase {

    private let manager = MockNetworkManager()
    private var sut: GetShortLinkRemoteDataSourceImplementation!

    override func setUp() {
        sut = GetShortLinkRemoteDataSourceImplementation(manager: manager)

        stub(manager) { stub in
            when(stub.request(
                    url: any(),
                onCompletion: any(((ApiShortenResponse) -> Void).self)
            )).thenDoNothing()
        }
    }

    func test_getShortLink() {
        // Arrange
        let originalLink = UUID().uuidString
        let captor = ArgumentCaptor<(ApiShortenResponse) -> Void>()
        let expectedResult = ApiShortenResponse.make()
        var executionResult: ApiShortenResponse!

        // Act
        sut.getShortLink(
            originalLink: originalLink, onCompletion: { response in
                executionResult = response
        })

        // Assert
        verify(manager).request(
            url: any(),
            onCompletion: captor.capture()
        )
        captor.value?(expectedResult)
        XCTAssert(expectedResult.isEqual(executionResult))
    }
}
