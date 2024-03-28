//
//  AnimatedNavigationTitleItemView.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

struct ScrollableTitleItemModifier: ViewModifier {
  // MARK: Reactive Parameters
  @Environment(\.safeAreaTopInset) private var safeAreaTopInset: CGFloat
  @Environment(\.titleContent) private var title: AnyView?
  @State private var itemDistanceToMinTop: CGFloat = .infinity
  @State private var itemHeight: CGFloat = .zero
  @State private var size: CGSize = .zero

  // MARK: Body
  func body(content: Content) -> some View {
    content
      .background(
        GeometryReader { geometry in
          let minY = geometry.frame(in: .global).minY

          Color.clear
            .onChange(of: minY) { _ in
              itemDistanceToMinTop = minY - safeAreaTopInset
              itemHeight = geometry.size.height
            }
        }
      )
      .toolbar {
        ToolbarItem(placement: .principal) {
          let percent: CGFloat = (itemDistanceToMinTop + itemHeight) / itemHeight
          let clamped: CGFloat = percent.clamped(0...1)

          if let title {
            title
              .frame(maxHeight: .infinity)
              .background(
                GeometryReader { proxy in
                  Color.clear.onAppear {
                    size = proxy.size
                  }
                }
              )
              .offset(y: size.height * clamped)
              .clipped()
          }
        }
      }
  }
}

extension View {
  func scrollableTitleAnchor() -> ModifiedContent<Self, ScrollableTitleItemModifier> {
    self.modifier(ScrollableTitleItemModifier())
  }
}

