//
//  HomeViewController+KeyboardEvents.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import UIKit

/// Extension with code to handle keyboard events
extension HomeViewController {
    // MARK: - keyboard events
    func setupKeyboardNotifications() {
        _ = NotificationCenter.default
            .addObserver(
                forName: UIResponder.keyboardWillShowNotification,
                object: nil,
                queue: .main
            ) { [weak self] notification in
                let keyboardSize = (
                    notification.userInfo?  [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
                )?.cgRectValue
                let keyboardHeight = keyboardSize?.height ?? 0
                self?.bottomViewBottomAnchorConstraint.constant = -keyboardHeight
                self?.scrollView.contentOffset = CGPoint(x: 0, y: self?.scrollView.frame.size.height ?? 0)
                // To move bottomView smoothly when keyboard appears
                UIView.animate(withDuration: 3, animations: {
                    self?.view.layoutIfNeeded()
                })
            }

        _ = NotificationCenter.default
            .addObserver(
                forName: UIResponder.keyboardWillHideNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                self?.bottomViewBottomAnchorConstraint.constant = 0
                // To move bottomView smoothly when keyboard hides
                UIView.animate(withDuration: 3, animations: {
                    self?.view.layoutIfNeeded()
                })
            }
    }
}
