//
//  EnvironmentKeys.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

struct AnimatedNavigationTitleSafeAreaTopInsetKey: EnvironmentKey {
  static let defaultValue: CGFloat = 0
}

struct AnimatedNavigationTitleVisibility: EnvironmentKey {
  /// Default value is 1, meaning that the title is by default translated on y by 100%
  static let defaultValue: Binding<CGFloat> = .constant(1)
}
