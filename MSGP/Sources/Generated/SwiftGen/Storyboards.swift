// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation
import UIKit

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

enum StoryboardScene {
  enum CreateAccount: StoryboardSceneType {
    static let storyboardName = "CreateAccount"
  }
  enum CreatePost: String, StoryboardSceneType {
    static let storyboardName = "CreatePost"

    case createPostViewControllerScene = "CreatePostViewController"
    static func instantiateCreatePostViewController() -> MSGP.CreatePostViewController {
      guard let vc = StoryboardScene.CreatePost.createPostViewControllerScene.viewController() as? MSGP.CreatePostViewController
      else {
        fatalError("ViewController 'CreatePostViewController' is not of the expected class MSGP.CreatePostViewController.")
      }
      return vc
    }
  }
  enum Login: StoryboardSceneType {
    static let storyboardName = "Login"
  }
  enum MenuStack: String, StoryboardSceneType {
    static let storyboardName = "MenuStack"

    static func initialViewController() -> UINavigationController {
      guard let vc = storyboard().instantiateInitialViewController() as? UINavigationController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case navigationStackContainerScene = "NavigationStackContainer"
    static func instantiateNavigationStackContainer() -> MSGP.NavigationStackContainer {
      guard let vc = StoryboardScene.MenuStack.navigationStackContainerScene.viewController() as? MSGP.NavigationStackContainer
      else {
        fatalError("ViewController 'NavigationStackContainer' is not of the expected class MSGP.NavigationStackContainer.")
      }
      return vc
    }

    case navigationStackMenuScene = "NavigationStackMenu"
    static func instantiateNavigationStackMenu() -> MSGP.MenuViewController {
      guard let vc = StoryboardScene.MenuStack.navigationStackMenuScene.viewController() as? MSGP.MenuViewController
      else {
        fatalError("ViewController 'NavigationStackMenu' is not of the expected class MSGP.MenuViewController.")
      }
      return vc
    }

    case tabMenuContainerViewControllerScene = "TabMenuContainerViewController"
    static func instantiateTabMenuContainerViewController() -> MSGP.TabMenuContainerViewController {
      guard let vc = StoryboardScene.MenuStack.tabMenuContainerViewControllerScene.viewController() as? MSGP.TabMenuContainerViewController
      else {
        fatalError("ViewController 'TabMenuContainerViewController' is not of the expected class MSGP.TabMenuContainerViewController.")
      }
      return vc
    }
  }
}

enum StoryboardSegue {
}

private final class BundleToken {}
