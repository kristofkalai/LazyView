//
//  LazyView.swift
//
//
//  Created by Kristóf Kálai on 21/10/2023.
//

import SwiftUI

public struct LazyView<Content: View> {
    private let build: () -> Content

    public init(_ build: @escaping () -> Content) {
        self.build = build
    }
}

extension LazyView {
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.init(build)
    }
}

extension LazyView: View {
    public var body: Content {
        build()
    }
}
