//
//  LinkTextField.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 03-09-21.
//

import UIKit

final class LinkTextField: UITextField {

    private enum Constants {
        static let cornerRadius: CGFloat = 4
        static let bodyFontSize: CGFloat = 17
        static let errorBorderWidth: CGFloat = 2
    }

    enum Style: Equatable, CaseIterable {
        case editing
        case error
    }

    var style: Style = .editing {
        didSet {
            layer.cornerRadius = Constants.cornerRadius
            font = FontFamily.Poppins.medium.font(size: Constants.bodyFontSize)
            autocapitalizationType = .none
            backgroundColor = Asset.Colors.backgroundWhite.color

            switch style {
            case .editing:
                borderStyle = .none
                layer.borderWidth = 0
                textAlignment = .center
                let attributeString = [
                    NSAttributedString.Key.foregroundColor: Asset.Colors.neutralLightGray.color.withAlphaComponent(1),
                    NSAttributedString.Key.font: FontFamily.Poppins.medium.font(size: Constants.bodyFontSize)
                ] as [NSAttributedString.Key: Any]
                attributedPlaceholder = NSAttributedString(
                    string: L10n.Placeholder.homeLink,
                    attributes: attributeString
                )
            case .error:
                borderStyle = .line
                layer.borderWidth = Constants.errorBorderWidth
                layer.borderColor = Asset.Colors.secondaryRed.color.cgColor
                placeholder = L10n.Placeholder.homeLinkError
                let attributeString = [
                    NSAttributedString.Key.foregroundColor: Asset.Colors.secondaryRed.color.withAlphaComponent(1),
                    NSAttributedString.Key.font: FontFamily.Poppins.medium.font(size: Constants.bodyFontSize)
                ] as [NSAttributedString.Key: Any]
                attributedPlaceholder = NSAttributedString(
                    string: L10n.Placeholder.homeLinkError,
                    attributes: attributeString
                )
            }
        }
    }
}
