//
//  AnimatedNavigationTitleView.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

public struct AnimatedNavigationTitleView<Title: View, Content: View>: View {
  // MARK: Parameters
  private let title: AnyView
  private let content: Content

  // MARK: Lifecycle
  public init(_ view: () -> Title, content: () -> Content) {
    self.title = AnyView(view())
    self.content = content()
  }

  public init(_ view: Title, content: () -> Content) {
    self.title = AnyView(view)
    self.content = content()
  }

  // MARK: Body
  public var body: some View {
    GeometryReader { proxy in
      content
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.safeAreaTopInset, proxy.safeAreaInsets.top)
        .environment(\.titleContent, title)
    }
  }
}

extension AnimatedNavigationTitleView where Title == EmptyView {
  public init(_ title: String, content: () -> Content) {
    self.title = AnyView(Text(title))
    self.content = content()
  }

  public init(_ title: LocalizedStringKey, content: () -> Content) {
    self.title = AnyView(Text(title))
    self.content = content()
  }

  public init(_ title: Text, content: () -> Content) {
    self.title = AnyView(title)
    self.content = content()
  }

  public init(_ title: () -> Text, content: () -> Content) {
    self.title = AnyView(title())
    self.content = content()
  }
}
