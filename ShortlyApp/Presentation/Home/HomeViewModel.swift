//
//  HomeViewModel.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 02-09-21.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeViewModel: BaseViewModel {

    struct Input {
        var link: String
    }

    struct Output {
        let showStartingView: Driver<Bool>
        let showHistoricalLinksView: Driver<[HistoricalLinkEntity]>
        let inputStyle: Driver<LinkTextField.Style>
        let clearScrollView: Driver<Void>
        let addLink: Driver<HistoricalLinkEntity>
        let showActivityIndicator: Driver<Bool>
        let showErrorAlert: Driver<String>
    }

    var input: Input
    var output: Output

    let showStartingViewSubject = PublishSubject<Bool>()
    let showHistoricalLinksViewSubject = PublishSubject<[HistoricalLinkEntity]>()
    let inputStyleSubject = PublishSubject<LinkTextField.Style>()
    let clearScrollViewSubject = PublishSubject<Void>()
    let addLinkViewSubject = PublishSubject<HistoricalLinkEntity>()
    let showActivityIndicatorSubject = PublishSubject<Bool>()
    let showErrorAlertSubject = PublishSubject<String>()

    private let getLinkHistoryUseCase: GetLinkHistoryUseCase
    private let getShortLinkUseCase: GetShortLinkUseCase
    private let saveLinkHistoryUseCase: SaveLinkHistoryUseCase
    private var linkHistory: [HistoricalLinkEntity] = []

    init(
        getLinkHistoryUseCase: GetLinkHistoryUseCase,
        getShortLinkUseCase: GetShortLinkUseCase,
        saveLinkHistoryUseCase: SaveLinkHistoryUseCase
    ) {
        self.getLinkHistoryUseCase = getLinkHistoryUseCase
        self.getShortLinkUseCase = getShortLinkUseCase
        self.saveLinkHistoryUseCase = saveLinkHistoryUseCase

        input = Input(link: "")
        output = Output(
            showStartingView: showStartingViewSubject.asDriver(onErrorJustReturn: true),
            showHistoricalLinksView: showHistoricalLinksViewSubject.asDriver(onErrorJustReturn: []),
            inputStyle: inputStyleSubject.asDriver(onErrorJustReturn: .error),
            clearScrollView: clearScrollViewSubject.asDriver(onErrorJustReturn: ()),
            addLink: addLinkViewSubject.asDriver(onErrorJustReturn: HistoricalLinkEntity.make()),
            showActivityIndicator: showActivityIndicatorSubject.asDriver(onErrorJustReturn: false),
            showErrorAlert: showErrorAlertSubject.asDriver(onErrorJustReturn: "")
        )

        super.init()
    }

    func onLinkTextFieldNotEmpty() {
        inputStyleSubject.onNext(.editing)
    }

    func onShortenItButtonTapped() {
        if input.link.isEmpty {
            inputStyleSubject.onNext(.error)
        } else {
            showActivityIndicatorSubject.onNext(true)
            getShortLinkUseCase.execute(originalLink: input.link, { [weak self] (apiResult, linkEntity) in
                if apiResult.validResult {
                    self?.showActivityIndicatorSubject.onNext(false)
                    self?.linkHistory.append(linkEntity)
                    self?.saveLinkHistoryUseCase.execute(linkHistory: self?.linkHistory ?? [], { success in
                        // Repaint screen
                        if success {
                            if self?.linkHistory.count == 1 {
                                self?.clearScrollViewSubject.onNext(())
                                self?.getLinkHistory()
                            } else {
                                self?.addLinkViewSubject.onNext(linkEntity)
                            }
                        }
                    })
                } else {
                    self?.showActivityIndicatorSubject.onNext(false)
                    if apiResult.errorCode == 0 {
                        self?.showErrorAlertSubject.onNext(L10n.Label.homeErrorAlertMessageUnknown)
                    } else {
                        self?.showErrorAlertSubject.onNext(apiResult.error)
                    }
                }
            })
        }
    }

    // MARK: - Controller interaction
    func getLinkHistory() {
        getLinkHistoryUseCase.execute({ [weak self] linkHistory in
            self?.displayContent(linkHistory: linkHistory)
        })
    }

    private func displayContent(linkHistory: [HistoricalLinkEntity]) {
        if linkHistory.isEmpty {
            showStartingViewSubject.onNext(true)
        } else {
            showHistoricalLinksViewSubject.onNext(linkHistory)
            self.linkHistory = linkHistory
        }
    }

    func onDeleteItem(with code: String) {
        var index = 0
        for item in linkHistory {
            if item.code == code {
                linkHistory.remove(at: index)
                break
            }
            index += 1
        }
        saveLinkHistoryUseCase.execute(linkHistory: linkHistory, { [weak self] success in
            // Repaint screen
            if success {
                self?.clearScrollViewSubject.onNext(())
                self?.getLinkHistory()
            }
        })
    }
}
