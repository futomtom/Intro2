// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias Image = UIImage
#elseif os(OSX)
  import AppKit.NSImage
  typealias Image = NSImage
#endif

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
enum Asset: String {
  case Mini_Cooper = "mini-cooper"
  case Navigation_bar_logo_white = "navigation_bar_logo_white"
  case Onboarding_backdrop = "onboarding_backdrop"
  case Onboarding_get_a_quote = "onboarding_get_a_quote"
  case Onboarding_notifications_bell = "onboarding_notifications_bell"
  case Onboarding_schedule_an_eval = "onboarding_schedule_an_eval"
  case Onboarding_your_car_sells = "onboarding_your_car_sells"
  case Porsche = "porsche"
  case Prius = "prius"
  case Wheel = "wheel"

  var image: Image {
    let bundle = NSBundle(forClass: BundleToken.self)
    #if os(iOS) || os(tvOS) || os(watchOS)
    let image = Image(named: rawValue, inBundle: bundle, compatibleWithTraitCollection: nil)
    #elseif os(OSX)
    let image = bundle.imageForResource(rawValue)
    #endif
    guard let result = image else { fatalError("Unable to load image \(rawValue).") }
    return result
  }
}
// swiftlint:enable type_body_length

extension Image {
  convenience init!(asset: Asset) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    let bundle = NSBundle(forClass: BundleToken.self)
    self.init(named: asset.rawValue, inBundle: bundle, compatibleWithTraitCollection: nil)
    #elseif os(OSX)
    self.init(named: asset.rawValue)
    #endif
  }
}

private final class BundleToken {}
