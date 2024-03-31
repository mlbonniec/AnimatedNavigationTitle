//
//  AnimatedNavigationTitleModel.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 29/03/2024.
//

import SwiftUI

public struct AnimatedNavigationTitleAnimationType: OptionSet {
  // MARK: Properties
  public let rawValue: Int

  // MARK: Lifecycle
  public init(rawValue: Int) {
    self.rawValue = rawValue
  }

  // MARK: Values
  public static let slide = AnimatedNavigationTitleAnimationType(rawValue: 1 << 0)
  public static let opacity = AnimatedNavigationTitleAnimationType(rawValue: 1 << 1)
  public static let all: AnimatedNavigationTitleAnimationType = [.opacity, .slide]
}

public enum AnimatedNavigationTitleAlignment {
  case leading, center, trailing

  var alignment: Alignment {
    switch self {
    case .leading:
      return .leading
    case .center:
      return .center
    case .trailing:
      return .trailing
    }
  }
}
