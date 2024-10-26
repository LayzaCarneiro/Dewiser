//
//  modifier.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 22/10/24.
//

import SwiftUI

private struct SizePreferenceKeyframe: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
    func readsSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                Color.clear.preference(key: SizePreferenceKeyframe.self, value: geometry.size)
            }
        )
        .onPreferenceChange(SizePreferenceKeyframe.self, perform: onChange)
    }
}

struct ScrollViewSwipeActionModifier: ViewModifier {
    @State private var size: CGSize = .init(width: 1, height: 1)
    //
    func body(content: Content) -> some View {
        List {
            LazyVStack {
                content
            }
            .frame(minHeight: 44)
            .readsSize { size in
                self.size = size
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .scrollDisabled(true)
        .listStyle(.plain)
        .frame(height: size.height)
        .contentMargins(.vertical, EdgeInsets(), for: .scrollContent)
    }
}

extension View {
    func enableScrollViewSwipeAction() -> some View {
        self.modifier(ScrollViewSwipeActionModifier())
    }
}
