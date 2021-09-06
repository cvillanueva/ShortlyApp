//
//  HomeViewController+UITextFieldDelegate.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import UIKit

extension HomeViewController: UITextFieldDelegate {
    // MARK: - TextFieldDelegate
    // To dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(
        _ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String
    ) -> Bool {

        if !string.isEmpty {
            viewModel.onLinkTextFieldNotEmpty()
            viewModel.input.link = (textField.text ?? "") + string
        } else {
            viewModel.input.link.removeLast()
        }

        return true
    }
}
