//
//  LazyNavigationLink.swift
//
//
//  Created by Kristóf Kálai on 21/10/2023.
//

import SwiftUI

public struct LazyNavigationLink<Label, Destination> where Label: View, Destination: View {
    enum Value {
        case first(titleKey: LocalizedStringKey, destination: () -> Destination)
        case second(destination: () -> Destination, label: () -> Label)
    }

    private let value: Value
}

extension LazyNavigationLink {
    public init(_ titleKey: LocalizedStringKey, destination: @escaping () -> Destination) where Label == Text {
        self.init(value: .first(titleKey: titleKey, destination: destination))
    }

    public init(destination: @escaping () -> Destination, label: @escaping () -> Label) {
        self.init(value: .second(destination: destination, label: label))
    }
}

extension LazyNavigationLink: View {
    public var body: some View {
        switch value {
        case let .first(titleKey, destination): NavigationLink(titleKey, destination: LazyView(destination()))
        case let .second(destination, label): NavigationLink(destination: LazyView(destination()), label: label)
        }
    }
}
