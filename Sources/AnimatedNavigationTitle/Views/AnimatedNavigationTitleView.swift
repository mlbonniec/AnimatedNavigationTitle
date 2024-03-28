//
//  AnimatedNavigationTitleView.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

struct AnimatedNavigationTitleView<Content: View>: View {
  // MARK: Parameters
  private let title: Text
  private let content: Content

  // MARK: Lifecycle
  init(_ title: LocalizedStringKey, content: @escaping () -> Content) {
    self.title = Text(title)
    self.content = content()
  }

  init(_ title: Text, content: @escaping () -> Content) {
    self.title = title
    self.content = content()
  }

  init(title: () -> Text, content: @escaping () -> Content) {
    self.title = title()
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
