//
//  AnimatedNavigationTitleView.swift
//  AnimatedNavigationTitle
//
//  Created by Mathis Le Bonniec on 28/03/2024.
//

import SwiftUI

public struct AnimatedNavigationTitleView<Title: View, Content: View>: View {
  // MARK: Reactive Properties
  @State private var doesTitleHeightBeenUpdated: Bool = false
  @State private var titleHeight: CGFloat = .zero
  @State private var titleVisibility: CGFloat = AnimatedNavigationTitleVisibility.defaultValue.wrappedValue

  // MARK: Parameters
  private let title: AnyView
  private let content: Content
  private let animation: AnimatedNavigationTitleAnimationType
  private let alignment: AnimatedNavigationTitleAlignment

  // MARK: Lifecycle
  public init(
    _ view: Title,
    animation: AnimatedNavigationTitleAnimationType = .slide,
    alignment: AnimatedNavigationTitleAlignment = .center,
    content: () -> Content
  ) {
    self.title = AnyView(view)
    self.animation = animation
    self.alignment = alignment
    self.content = content()
  }

  public init(
    _ view: () -> Title,
    animation: AnimatedNavigationTitleAnimationType = .slide,
    alignment: AnimatedNavigationTitleAlignment = .center,
    content: () -> Content
  ) {
    self.init(view(), animation: animation, alignment: alignment, content: content)
  }

  // MARK: Computed Properties
  private var opacity: CGFloat {
    guard doesTitleHeightBeenUpdated else { return 0 }
    let hasOpacityAnimation: Bool = self.animation.contains(.opacity)

    if doesTitleHeightBeenUpdated && !hasOpacityAnimation {
      return 1
    }

    return hasOpacityAnimation ? 1 - titleVisibility : 0
  }

  private var offset: CGFloat {
    self.animation.contains(.slide) ? titleHeight * titleVisibility : 0
  }

  private var maxWidth: CGFloat? {
    switch alignment {
    case .leading, .trailing:
      return .infinity
    case .center:
      return nil
    }
  }

  // MARK: Body
  public var body: some View {
    GeometryReader { mainProxy in
      content
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.safeAreaTopInset, mainProxy.safeAreaInsets.top)
        .environment(\.animatedNavigationTitleVisibility, $titleVisibility)
        .toolbar {
          ToolbarItem(placement: .principal) {
            title
              .frame(maxWidth: maxWidth, maxHeight: .infinity, alignment: alignment.alignment)
              .background(
                GeometryReader { proxy in
                  Color.clear.onAppear {
                    didTitleHeightChanged(proxy: proxy)
                  }
                  Color.clear.onChange(of: proxy.size) { _ in
                    didTitleHeightChanged(proxy: proxy)
                  }
                }
              )
              .opacity(opacity)
              .offset(y: offset)
              .clipped()
          }
        }
    }
  }

  // MARK: Methods
  private func didTitleHeightChanged(proxy: GeometryProxy) {
    titleHeight = proxy.size.height
    doesTitleHeightBeenUpdated = true
  }
}

extension AnimatedNavigationTitleView where Title == EmptyView {
  public init(
    _ title: Text,
    animation: AnimatedNavigationTitleAnimationType = .slide,
    alignment: AnimatedNavigationTitleAlignment = .center,
    content: () -> Content
  ) {
    self.title = AnyView(title)
    self.animation = animation
    self.alignment = alignment
    self.content = content()
  }

  public init(
    _ title: String,
    animation: AnimatedNavigationTitleAnimationType = .slide,
    alignment: AnimatedNavigationTitleAlignment = .center,
    content: () -> Content
  ) {
    self.init(Text(title), animation: animation, alignment: alignment, content: content)
  }

  public init(
    _ title: LocalizedStringKey,
    animation: AnimatedNavigationTitleAnimationType = .slide,
    alignment: AnimatedNavigationTitleAlignment = .center,
    content: () -> Content
  ) {
    self.init(Text(title), animation: animation, alignment: alignment, content: content)
  }

  public init(
    _ title: () -> Text,
    animation: AnimatedNavigationTitleAnimationType = .slide,
    alignment: AnimatedNavigationTitleAlignment = .center,
    content: () -> Content
  ) {
    self.init(title(), animation: animation, alignment: alignment, content: content)
  }
}
