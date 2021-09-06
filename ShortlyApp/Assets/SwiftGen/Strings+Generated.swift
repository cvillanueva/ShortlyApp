// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Button {
    /// COPIED!
    internal static let historicalLinkCopied = L10n.tr("Button", "historical_link_copied")
    /// COPY
    internal static let historicalLinkCopy = L10n.tr("Button", "historical_link_copy")
    /// Ok
    internal static let homeAlertOk = L10n.tr("Button", "home_alert_ok")
    /// SHORTEN IT!
    internal static let homeShortenIt = L10n.tr("Button", "home_shorten_it")
  }
  internal enum Label {
    /// Unknown error
    internal static let homeErrorAlertMessageUnknown = L10n.tr("Label", "home_error_alert_message_unknown")
    /// An error happened!
    internal static let homeErrorAlertTitle = L10n.tr("Label", "home_error_alert_title")
    /// Your Link History
    internal static let homeLinksHistory = L10n.tr("Label", "home_links_history")
    /// Paste your first link into\nthe field to shorten it
    internal static let homeSubhead = L10n.tr("Label", "home_subhead")
    /// Let’s get started!
    internal static let homeTitle = L10n.tr("Label", "home_title")
  }
  internal enum Placeholder {
    /// Shorten a link here ...
    internal static let homeLink = L10n.tr("Placeholder", "home_link")
    /// Please add a link here ...
    internal static let homeLinkError = L10n.tr("Placeholder", "home_link_error")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
