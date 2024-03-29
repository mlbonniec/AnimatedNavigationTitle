//
//  EnvironmentValues.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

extension EnvironmentValues {
  var safeAreaTopInset: CGFloat {
    get { self[AnimatedNavigationTitleSafeAreaTopInsetKey.self] }
    set { self[AnimatedNavigationTitleSafeAreaTopInsetKey.self] = newValue }
  }

  var animatedNavigationTitleVisibility: Binding<CGFloat> {
    get { self[AnimatedNavigationTitleVisibility.self] }
    set { self[AnimatedNavigationTitleVisibility.self] = newValue }
  }
}
