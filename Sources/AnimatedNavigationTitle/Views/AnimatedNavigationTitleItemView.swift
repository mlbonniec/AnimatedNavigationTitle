//
//  AnimatedNavigationTitleItemView.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

public struct ScrollableTitleItemModifier: ViewModifier {
  // MARK: Reactive Parameters
  @Environment(\.safeAreaTopInset) private var safeAreaTopInset: CGFloat
  @Environment(\.animatedNavigationTitleVisibility) private var titleVisibility: Binding<CGFloat>

  // MARK: Body
  public func body(content: Content) -> some View {
    content
      .background(
        GeometryReader { geometry in
          Color.clear
            .onChange(of: geometry.frame(in: .global).minY) { _ in
              updateTitleVisibility(geometry: geometry)
            }
        }
      )
  }

  // MARK: Methods
  func updateTitleVisibility(geometry: GeometryProxy) {
    let minY = geometry.frame(in: .global).minY
    let itemDistanceToMinTop: CGFloat = minY - safeAreaTopInset
    let itemHeight: CGFloat = geometry.size.height
    let percent: CGFloat = (itemDistanceToMinTop + itemHeight) / itemHeight

    titleVisibility.wrappedValue = percent.clamped(0...1)
  }
}

extension View {
  public func scrollableTitleAnchor() -> ModifiedContent<Self, ScrollableTitleItemModifier> {
    self.modifier(ScrollableTitleItemModifier())
  }
}

