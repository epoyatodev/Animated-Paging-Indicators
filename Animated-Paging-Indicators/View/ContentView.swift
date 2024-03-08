//
//  ContentView.swift
//  Animated-Paging-Indicators
//
//  Created by enrique.poyato on 8/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [.blue, .red, .orange, .green]
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 26)
                                .fill(color.gradient)
                                .padding(.horizontal)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                    .overlay(alignment: .bottom) {
                        PagingIndicator(activeTint: .white)
                    }
                }
                .scrollTargetBehavior(.paging)
                .frame(height: 500)
                .scrollIndicators(.hidden)
            }
            .navigationTitle("Paging Indicator")
        }
    }
}

#Preview {
    ContentView()
}
