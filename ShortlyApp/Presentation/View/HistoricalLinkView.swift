//
//  HistoricalLinkView.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import UIKit

protocol HistoricalLinkViewDelegate: AnyObject {
    func deleteItem(with code: String)
}

final class HistoricalLinkView: UIView {

    private enum Constants {
        static let height: CGFloat = 177
        static let viewCornerRadius: CGFloat = 8
        static let separatorTopAnchor: CGFloat = 57
        static let separatorHeight: CGFloat = 1
        static let padding: CGFloat = 23
        static let originalLinkRightPadding: CGFloat = 56
        static let buttonCornerRadius: CGFloat = 4
        static let buttonTitleFontSize: CGFloat = 17
        static let buttonHeight: CGFloat = 39
        static let labelFontSize: CGFloat = 17
        static let deleteButtonTrailingAnchor: CGFloat = 10
    }

    private var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Asset.Colors.neutralLightGray.color
        return view
    }()

    private var originalLinkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = FontFamily.Poppins.medium.font(size: Constants.labelFontSize)
        label.textColor = Asset.Colors.neutralVeryDarkViolet.color
        return label
    }()

    private var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Asset.Assets.del.image, for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    private var shortLinkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = FontFamily.Poppins.medium.font(size: Constants.labelFontSize)
        label.textColor = Asset.Colors.primaryCyan.color
        return label
    }()

    private var copyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.backgroundColor = Asset.Colors.primaryCyan.color.cgColor
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.setTitle(L10n.Button.historicalLinkCopy, for: .normal)
        button.setTitleColor(Asset.Colors.neutralGrayishViolet.color, for: .highlighted)
        button.tintColor = Asset.Colors.backgroundWhite.color
        button.titleLabel?.font = FontFamily.Poppins.bold.font(size: Constants.buttonTitleFontSize)
        button.addTarget(self, action: #selector(copyButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    let historicalLinkEntity: HistoricalLinkEntity
    weak var delegate: HistoricalLinkViewDelegate?

    init(
        historicalLinkEntity: HistoricalLinkEntity,
        parentView: UIStackView,
        delegate: HistoricalLinkViewDelegate
    ) {
        self.historicalLinkEntity = historicalLinkEntity
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
        setupConstraints(parentView: parentView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints(parentView: UIStackView) {
        // Main view
        heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        separatorView.topAnchor.constraint(
            equalTo: topAnchor, constant: Constants.separatorTopAnchor
        ).isActive = true

        // Separator
        separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight).isActive = true
        separatorView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

        // Original link label
        originalLinkLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.padding).isActive = true
        originalLinkLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding).isActive = true
        originalLinkLabel.trailingAnchor.constraint(
            equalTo: trailingAnchor, constant: -Constants.originalLinkRightPadding
        ).isActive = true
        originalLinkLabel.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true

        // Delete button
        deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.padding).isActive = true
        deleteButton.trailingAnchor.constraint(
            equalTo: trailingAnchor, constant: -Constants.deleteButtonTrailingAnchor
        ).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true

        // Short link label
        shortLinkLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        shortLinkLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding).isActive = true
        shortLinkLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding).isActive = true
        shortLinkLabel.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true

        // Copy button
        copyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.padding).isActive = true
        copyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding).isActive = true
        copyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding).isActive = true
        copyButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }

    private func setupUI() {
        backgroundColor = Asset.Colors.backgroundWhite.color
        layer.cornerRadius = Constants.viewCornerRadius

        addSubview(separatorView)
        originalLinkLabel.text = historicalLinkEntity.originalLink
        addSubview(originalLinkLabel)
        addSubview(deleteButton)
        shortLinkLabel.text = historicalLinkEntity.shortLink
        addSubview(shortLinkLabel)
        addSubview(copyButton)
    }

    @objc private func copyButtonTapped(_ sender: UIButton) {
        copyButton.layer.backgroundColor = Asset.Colors.primaryDarkViolet.color.cgColor
        copyButton.setTitle(L10n.Button.historicalLinkCopied, for: .normal)
        // Copy to clipboard
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = historicalLinkEntity.shortLink
    }

    @objc private func deleteButtonTapped(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.deleteItem(with: historicalLinkEntity.code)
        }
    }
}
