//
//  Comparable+Clamp.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

extension Comparable {
  /// Clamp the value inside the specified range.
  /// - Parameters:
  ///   - range: A closed range to clamp the value.
  /// - Returns: The clamped value.
  func clamped(_ range: ClosedRange<Self>) -> Self {
    min(max(self, range.lowerBound), range.upperBound)
  }
}
