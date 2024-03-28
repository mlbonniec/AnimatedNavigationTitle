//
//  EnvironmentKeys.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

struct AnimatedNavigationSafeAreaTopInsetKey: EnvironmentKey {
  static let defaultValue: CGFloat = 0
}

struct AnimatedNavigationTitleContent: EnvironmentKey {
  static let defaultValue: AnyView? = nil
}
