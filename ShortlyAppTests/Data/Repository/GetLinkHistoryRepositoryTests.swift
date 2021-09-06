//
//  GetLinkHistoryRepositoryTests.swift
//  ShortlyAppTests
//
//  Created by Claudio Villanueva on 06-09-21.
//

@testable import ShortlyApp
import XCTest
import Cuckoo

final class GetLinkHistoryRepositoryTests: XCTestCase {
    private var sut: GetLinkHistoryRepositoryImplementation!
    private var local = MockLinkLocalDataSource()
    private let expectedResult = [HistoricalLinkEntity]()

    override func setUp() {
        sut = GetLinkHistoryRepositoryImplementation(localDataSource: local)

        stub(local) { stub in
            when(stub.getLinkHistory(
                onCompletion: any((([HistoricalLinkEntity]) -> Void).self)
            )).thenDoNothing()
        }
    }

    func test() {
        // Arrange
        let captor = ArgumentCaptor<([HistoricalLinkEntity]) -> Void>()
        var executionResult: [HistoricalLinkEntity]!

        // Act
        sut.getLinkHistory(
            onCompletion: { linkHistory in
                executionResult = linkHistory
        })

        // Assert
        verify(local).getLinkHistory(
            onCompletion: captor.capture()
        )
        captor.value?(expectedResult)
        XCTAssert(executionResult.elementsEqual(expectedResult))
    }
}
