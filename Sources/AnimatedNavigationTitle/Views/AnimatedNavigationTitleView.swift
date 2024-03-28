//
//  AnimatedNavigationTitleView.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

struct AnimatedNavigationTitleView<Content: View>: View {
  // MARK: Parameters
  private let title: AnyView
  private let content: Content

  // MARK: Lifecycle
  init(_ title: LocalizedStringKey, content: () -> Content) {
    self.title = AnyView(Text(title))
    self.content = content()
  }

  init(_ title: Text, content: () -> Content) {
    self.title = AnyView(title)
    self.content = content()
  }

  init(_ title: () -> Text, content: () -> Content) {
    self.title = AnyView(title())
    self.content = content()
  }

  init(_ view: () -> AnyView, content: () -> Content) {
    self.title = view()
    self.content = content()
  }

  // MARK: Body
  var body: some View {
    GeometryReader { proxy in
      content
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.safeAreaTopInset, proxy.safeAreaInsets.top)
        .environment(\.titleContent, title)
    }
  }
}
