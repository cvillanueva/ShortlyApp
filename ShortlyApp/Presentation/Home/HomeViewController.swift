//
//  ViewController.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 02-09-21.
//

import UIKit

// swiftlint:disable nesting
// swiftlint:disable file_length
// swiftlint:disable type_body_length
final class HomeViewController: BaseViewController<HomeViewModel, Coordinator> {

    private enum Constants {

        enum StartingView {
            static let titleFontSize: CGFloat = 20
            static let bodyFontSize: CGFloat = 17

            case titleTopAnchor(CGFloat)
            case illustrationTopAnchor(CGFloat)

            static let logoTopAnchor: CGFloat = 18

            // Computed properties to fit design in iPhone SE 2020 Screen
            var illustrationTopAnchor: CGFloat {
                switch self {
                case .illustrationTopAnchor(667):
                    return CGFloat(-15)
                default:
                    return CGFloat(14)
                }
            }
            var titleTopAnchor: CGFloat {
                switch self {
                case .titleTopAnchor(667):
                    return CGFloat(-25)
                default:
                    return CGFloat(12)
                }
            }

            static let subheadLines = 2
            static let subheadTopAnchor: CGFloat = 7
        }

        enum StackView {
            static let titleTopAnchor: CGFloat = 41
            static let spacing: CGFloat = 19
            static let edgeInsets = NSDirectionalEdgeInsets(
                top: 0, leading: 24, bottom: 0, trailing: 24
            )
        }

        enum BottomView {
            static let bottomViewHeight: CGFloat = 204
            static let linkTextFieldTopAnchor: CGFloat = 46
            static let sideAnchor: CGFloat = 48
            static let linkTextFieldHeight: CGFloat = 49
            static let cornerRadius: CGFloat = 4
            static let buttonTopAnchor: CGFloat = 10
        }
    }

    // MARK: - Widgets
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height
        )
        scrollView.indicatorStyle = .white
        return scrollView
    }()

    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Asset.Assets.logo.image
        return imageView
    }()

    private var illustrationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Asset.Assets.illustration.image
        return imageView
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = L10n.Label.homeTitle
        label.font = FontFamily.Poppins.bold.font(size: Constants.StartingView.titleFontSize)
        return label
    }()

    private var subheadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = L10n.Label.homeSubhead
        label.font = FontFamily.Poppins.medium.font(size: Constants.StartingView.bodyFontSize)
        label.numberOfLines = Constants.StartingView.subheadLines
        label.textAlignment = .center
        return label
    }()

    private var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Asset.Colors.primaryDarkViolet.color
        return view
    }()

    var bottomViewBottomAnchorConstraint: NSLayoutConstraint!

    private var shapeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Asset.Assets.shape.image
        return imageView
    }()

    private var historicalLinksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Constants.StackView.spacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = Constants.StackView.edgeInsets
        return stackView
    }()

    private var linkTextField: LinkTextField = {
        let textField = LinkTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.style = .editing
        return textField
    }()

    private var shortenItButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.backgroundColor = Asset.Colors.primaryCyan.color.cgColor
        button.setTitleColor(Asset.Colors.neutralGrayishViolet.color, for: .highlighted)
        button.layer.cornerRadius = Constants.BottomView.cornerRadius
        button.setTitle(L10n.Button.homeShortenIt, for: .normal)
        button.tintColor = Asset.Colors.backgroundWhite.color
        button.titleLabel?.font = FontFamily.Poppins.bold.font(size: Constants.StartingView.titleFontSize)
        button.addTarget(self, action: #selector(shortenItButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    private var linksHistoryTitle: UILabel = {
        let label = UILabel()
        label.text = L10n.Label.homeLinksHistory
        label.font = FontFamily.Poppins.medium.font(size: Constants.StartingView.bodyFontSize)
        label.textAlignment = .center
        return label
    }()

    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.getLinkHistory()
    }

    // MARK: - Paint

    /// User interface setup
    private func setupUI() {
        view.backgroundColor = Asset.Colors.backgroundOffWhite.color
        view.addSubview(scrollView)
        view.addSubview(bottomView)
        bottomView.addSubview(shapeImageView)
        bottomView.addSubview(linkTextField)
        bottomView.addSubview(shortenItButton)

        setupScrollViewConstraints()
        setupBotomViewConstraints(bottomConstraint: 0)
        setupShapeConstraints()
        setupTextFieldConstraints()
        setupShortenItButtonConstraints()

        setupKeyboardNotifications()
        linkTextField.delegate = self
    }

    private func showStartingView() {
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(illustrationImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subheadLabel)

        setupContentViewConstraints()
        setupLogoConstraints()
        setupIllustrationConstraints()
        setupTitleConstraints()
        setupSubheadConstraints()
    }

    private func showHistoricalLinks(linkHistory: [HistoricalLinkEntity]) {
        scrollView.addSubview(historicalLinksStackView)
        setupHistoricalLinksConstraints()

        clearView(view: historicalLinksStackView)
        historicalLinksStackView.addArrangedSubview(linksHistoryTitle)

        for historicalLink in linkHistory {
            addLinkToScrollView(historicalLink: historicalLink)
        }
    }

    private func clearView(view: UIView) {
        let subViews = view.subviews
        for subview in subViews {
            subview.removeFromSuperview()
        }
    }

    private func addLinkToScrollView(historicalLink: HistoricalLinkEntity) {
        let view = HistoricalLinkView(
            historicalLinkEntity: historicalLink,
            parentView: historicalLinksStackView,
            delegate: self
        )
        historicalLinksStackView.addArrangedSubview(view)
    }

    @objc private func shortenItButtonTapped(_ sender: UIButton) {
        viewModel.onShortenItButtonTapped()
    }

    private func showActivityIndicator() {
        view.addSubview(activityIndicator)
        setupActivityIndicatorConstraints()
    }

    private func removeActivityIndicator() {
        linkTextField.text = ""
        let subViews = view.subviews
        for subview in subViews {
            if subview.isKind(of: UIActivityIndicatorView.self) {
                subview.removeFromSuperview()
            }
        }
    }

    private func deleteLink(with code: String) {
        viewModel.onDeleteItem(with: code)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(
            title: L10n.Label.homeErrorAlertTitle,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: L10n.Button.homeAlertOk, style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    // MARK: - Rx
    private func bindViewModel() {
        viewModel.output.showStartingView
            .drive(
                onNext: { [weak self] show in
                    if show {
                        self?.showStartingView()
                    }
                }
            ).disposed(by: disposeBag)

        viewModel.output.showHistoricalLinksView
            .drive(
                onNext: { [weak self] linkHistory in
                    self?.showHistoricalLinks(linkHistory: linkHistory)
                }
            ).disposed(by: disposeBag)

        viewModel.output.inputStyle
            .drive(
                onNext: { [weak self] style in
                    self?.linkTextField.style = style
                }
            ).disposed(by: disposeBag)

        viewModel.output.clearScrollView
            .drive(
                onNext: { [weak self] _ in
                    self?.clearView(view: self?.scrollView ?? UIScrollView())
                }
            ).disposed(by: disposeBag)

        viewModel.output.addLink
            .drive(
                onNext: { [weak self] historicalLink in
                    self?.addLinkToScrollView(historicalLink: historicalLink)
                }
            ).disposed(by: disposeBag)

        viewModel.output.showActivityIndicator
            .drive(
                onNext: { [weak self] show in
                    if show {
                        self?.showActivityIndicator()
                    } else {
                        self?.removeActivityIndicator()
                    }
                }
            ).disposed(by: disposeBag)

        viewModel.output.showErrorAlert
            .drive(
                onNext: { [weak self] message in
                    self?.showAlert(message: message)
                }
            ).disposed(by: disposeBag)
    }
}
/// Extension with code to handle constraints setup
extension HomeViewController {
    // MARK: - Constraints handling
    private func setupScrollViewConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    private func setupContentViewConstraints() {
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    private func setupHistoricalLinksConstraints() {
        historicalLinksStackView.topAnchor.constraint(
            equalTo: scrollView.topAnchor, constant: Constants.StackView.titleTopAnchor
        ).isActive = true
        historicalLinksStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        historicalLinksStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        historicalLinksStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        historicalLinksStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    private func setupLogoConstraints() {
        logoImageView.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: Constants.StartingView.logoTopAnchor
        ).isActive = true

        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func setupIllustrationConstraints() {
        illustrationImageView.topAnchor.constraint(
            equalTo: logoImageView.bottomAnchor,
            constant: Constants.StartingView.illustrationTopAnchor(UIScreen.main.bounds.height).illustrationTopAnchor
        ).isActive = true

        illustrationImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    private func setupTitleConstraints() {
        titleLabel.topAnchor.constraint(
            equalTo: illustrationImageView.bottomAnchor,
            constant: Constants.StartingView.titleTopAnchor(UIScreen.main.bounds.height).titleTopAnchor
        ).isActive = true

        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    private func setupSubheadConstraints() {
        subheadLabel.topAnchor.constraint(
            equalTo: titleLabel.bottomAnchor,
            constant: Constants.StartingView.subheadTopAnchor
        ).isActive = true

        subheadLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        subheadLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func setupBotomViewConstraints(bottomConstraint: CGFloat) {
        bottomViewBottomAnchorConstraint = NSLayoutConstraint(
            item: bottomView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: 0
        )
        NSLayoutConstraint.activate([bottomViewBottomAnchorConstraint])

        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: Constants.BottomView.bottomViewHeight).isActive = true
    }

    private func setupShapeConstraints() {
        shapeImageView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
    }

    private func setupTextFieldConstraints() {
        linkTextField.topAnchor.constraint(
            equalTo: bottomView.topAnchor, constant: Constants.BottomView.linkTextFieldTopAnchor
        ).isActive = true

        linkTextField.leadingAnchor.constraint(
            equalTo: bottomView.leadingAnchor, constant: Constants.BottomView.sideAnchor
        ).isActive = true

        linkTextField.trailingAnchor.constraint(
            equalTo: bottomView.trailingAnchor, constant: -Constants.BottomView.sideAnchor
        ).isActive = true

        linkTextField.heightAnchor.constraint(
            equalToConstant: Constants.BottomView.linkTextFieldHeight
        ).isActive = true
    }

    private func setupShortenItButtonConstraints() {
        shortenItButton.topAnchor.constraint(
            equalTo: linkTextField.bottomAnchor, constant: Constants.BottomView.buttonTopAnchor
        ).isActive = true

        shortenItButton.leadingAnchor.constraint(
            equalTo: bottomView.leadingAnchor, constant: Constants.BottomView.sideAnchor
        ).isActive = true

        shortenItButton.trailingAnchor.constraint(
            equalTo: bottomView.trailingAnchor, constant: -Constants.BottomView.sideAnchor
        ).isActive = true

        shortenItButton.heightAnchor.constraint(
            equalToConstant: Constants.BottomView.linkTextFieldHeight
        ).isActive = true
    }

    private func setupActivityIndicatorConstraints() {
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

/// Extension to handle HistoricalLinkViewDelegate
extension HomeViewController: HistoricalLinkViewDelegate {
    func deleteItem(with code: String) {
        deleteLink(with: code)
    }
}
