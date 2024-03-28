//
//  EnvironmentValues.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

extension EnvironmentValues {
  var safeAreaTopInset: CGFloat {
    get { self[AnimatedNavigationSafeAreaTopInsetKey.self] }
    set { self[AnimatedNavigationSafeAreaTopInsetKey.self] = newValue }
  }

  var titleContent: Text? {
    get { self[AnimatedNavigationTitleContent.self] }
    set { self[AnimatedNavigationTitleContent.self] = newValue }
  }
}
