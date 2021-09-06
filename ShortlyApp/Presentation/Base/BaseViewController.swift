//
//  BaseViewController.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 02-09-21.
//

import UIKit
import RxSwift
import RxCocoa

/// This class implements common behaviour for all view controllers
class BaseViewController<V: BaseViewModel, C: Coordinator>: UIViewController {

    let viewModel: V
    let coordinator: C
    let disposeBag = DisposeBag()

    init(
        _ viewModel: V,
        _ coordinator: C
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // To hide navigation bar
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // To hide navigation bar
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
