//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 2 colors.
  struct color {
    /// Color `BackgroundCell`.
    static let backgroundCell = Rswift.ColorResource(bundle: R.hostingBundle, name: "BackgroundCell")
    /// Color `Main`.
    static let main = Rswift.ColorResource(bundle: R.hostingBundle, name: "Main")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "BackgroundCell", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func backgroundCell(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.backgroundCell, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Main", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func main(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.main, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 10 images.
  struct image {
    /// Image `FilterIcon`.
    static let filterIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "FilterIcon")
    /// Image `Movs_Logo`.
    static let movs_Logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "Movs_Logo")
    /// Image `NoImage`.
    static let noImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "NoImage")
    /// Image `check_icon`.
    static let check_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "check_icon")
    /// Image `error_icon`.
    static let error_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "error_icon")
    /// Image `favorite_empty_icon`.
    static let favorite_empty_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "favorite_empty_icon")
    /// Image `favorite_full_icon`.
    static let favorite_full_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "favorite_full_icon")
    /// Image `favorite_gray_icon`.
    static let favorite_gray_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "favorite_gray_icon")
    /// Image `list_icon`.
    static let list_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "list_icon")
    /// Image `search_icon`.
    static let search_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "search_icon")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "FilterIcon", bundle: ..., traitCollection: ...)`
    static func filterIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.filterIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Movs_Logo", bundle: ..., traitCollection: ...)`
    static func movs_Logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.movs_Logo, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "NoImage", bundle: ..., traitCollection: ...)`
    static func noImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.noImage, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "check_icon", bundle: ..., traitCollection: ...)`
    static func check_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.check_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "error_icon", bundle: ..., traitCollection: ...)`
    static func error_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.error_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "favorite_empty_icon", bundle: ..., traitCollection: ...)`
    static func favorite_empty_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.favorite_empty_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "favorite_full_icon", bundle: ..., traitCollection: ...)`
    static func favorite_full_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.favorite_full_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "favorite_gray_icon", bundle: ..., traitCollection: ...)`
    static func favorite_gray_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.favorite_gray_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "list_icon", bundle: ..., traitCollection: ...)`
    static func list_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.list_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "search_icon", bundle: ..., traitCollection: ...)`
    static func search_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.search_icon, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 4 localization tables.
  struct string {
    /// This `R.string.apI` struct is generated, and contains static references to 4 localization keys.
    struct apI {
      /// Value: f350a5f7c3ef3d8e9235fcbe68ce665c
      static let apiKey = Rswift.StringResource(key: "apiKey", tableName: "API", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: http://image.tmdb.org/t/p/w780
      static let basePathUrlImage = Rswift.StringResource(key: "basePathUrlImage", tableName: "API", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: https://api.themoviedb.org/3/movie/popular?language=en-US
      static let basePathRequestMovie = Rswift.StringResource(key: "basePathRequestMovie", tableName: "API", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: https://api.themoviedb.org/3/search/movie?language=en-US&include_adult=false
      static let basePathRequesthMovieByName = Rswift.StringResource(key: "basePathRequesthMovieByName", tableName: "API", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: f350a5f7c3ef3d8e9235fcbe68ce665c
      static func apiKey(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("apiKey", tableName: "API", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "API", preferredLanguages: preferredLanguages) else {
          return "apiKey"
        }

        return NSLocalizedString("apiKey", tableName: "API", bundle: bundle, comment: "")
      }

      /// Value: http://image.tmdb.org/t/p/w780
      static func basePathUrlImage(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("basePathUrlImage", tableName: "API", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "API", preferredLanguages: preferredLanguages) else {
          return "basePathUrlImage"
        }

        return NSLocalizedString("basePathUrlImage", tableName: "API", bundle: bundle, comment: "")
      }

      /// Value: https://api.themoviedb.org/3/movie/popular?language=en-US
      static func basePathRequestMovie(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("basePathRequestMovie", tableName: "API", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "API", preferredLanguages: preferredLanguages) else {
          return "basePathRequestMovie"
        }

        return NSLocalizedString("basePathRequestMovie", tableName: "API", bundle: bundle, comment: "")
      }

      /// Value: https://api.themoviedb.org/3/search/movie?language=en-US&include_adult=false
      static func basePathRequesthMovieByName(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("basePathRequesthMovieByName", tableName: "API", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "API", preferredLanguages: preferredLanguages) else {
          return "basePathRequesthMovieByName"
        }

        return NSLocalizedString("basePathRequesthMovieByName", tableName: "API", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.common` struct is generated, and contains static references to 2 localization keys.
    struct common {
      /// Value: Search
      static let searchBarPlaceholder = Rswift.StringResource(key: "searchBarPlaceholder", tableName: "Common", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Undefined
      static let labelEmpty = Rswift.StringResource(key: "labelEmpty", tableName: "Common", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Search
      static func searchBarPlaceholder(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("searchBarPlaceholder", tableName: "Common", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Common", preferredLanguages: preferredLanguages) else {
          return "searchBarPlaceholder"
        }

        return NSLocalizedString("searchBarPlaceholder", tableName: "Common", bundle: bundle, comment: "")
      }

      /// Value: Undefined
      static func labelEmpty(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("labelEmpty", tableName: "Common", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Common", preferredLanguages: preferredLanguages) else {
          return "labelEmpty"
        }

        return NSLocalizedString("labelEmpty", tableName: "Common", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.controller` struct is generated, and contains static references to 1 localization keys.
    struct controller {
      /// Value: Movies
      static let movieTitle = Rswift.StringResource(key: "movieTitle", tableName: "Controller", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Movies
      static func movieTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("movieTitle", tableName: "Controller", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Controller", preferredLanguages: preferredLanguages) else {
          return "movieTitle"
        }

        return NSLocalizedString("movieTitle", tableName: "Controller", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.error` struct is generated, and contains static references to 4 localization keys.
    struct error {
      /// Value: Erro em converter os dados: 
      static let decodeError = Rswift.StringResource(key: "decodeError", tableName: "Error", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Erro na API: 
      static let apiError = Rswift.StringResource(key: "apiError", tableName: "Error", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Nenhum filme encontrado.
      static let empty = Rswift.StringResource(key: "empty", tableName: "Error", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sua busca por '(titleFiltered)' não resultou em nenhum resultado.
      static let emptyWithFilter = Rswift.StringResource(key: "emptyWithFilter", tableName: "Error", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Erro em converter os dados: 
      static func decodeError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("decodeError", tableName: "Error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Error", preferredLanguages: preferredLanguages) else {
          return "decodeError"
        }

        return NSLocalizedString("decodeError", tableName: "Error", bundle: bundle, comment: "")
      }

      /// Value: Erro na API: 
      static func apiError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("apiError", tableName: "Error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Error", preferredLanguages: preferredLanguages) else {
          return "apiError"
        }

        return NSLocalizedString("apiError", tableName: "Error", bundle: bundle, comment: "")
      }

      /// Value: Nenhum filme encontrado.
      static func empty(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("empty", tableName: "Error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Error", preferredLanguages: preferredLanguages) else {
          return "empty"
        }

        return NSLocalizedString("empty", tableName: "Error", bundle: bundle, comment: "")
      }

      /// Value: Sua busca por '(titleFiltered)' não resultou em nenhum resultado.
      static func emptyWithFilter(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("emptyWithFilter", tableName: "Error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Error", preferredLanguages: preferredLanguages) else {
          return "emptyWithFilter"
        }

        return NSLocalizedString("emptyWithFilter", tableName: "Error", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
