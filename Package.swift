// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AnimatedNavigationTitle",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "AnimatedNavigationTitle",
      targets: ["AnimatedNavigationTitle"]
    )
  ],
  targets: [
    .target(
      name: "AnimatedNavigationTitle"
    )
  ]
)
