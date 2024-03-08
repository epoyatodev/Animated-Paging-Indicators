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
                ScrollViewReader { scrollView in 
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(0..<colors.count, id: \.self) { index in
                                RoundedRectangle(cornerRadius: 26)
                                    .fill(colors[index].gradient)
                                    .padding(.horizontal)
                                    .containerRelativeFrame(.horizontal)
                                    .id(index)
                            }
                        }
                        .overlay(alignment: .bottom) {
                            PagingIndicator(activeTint: .white, scrollViewProxy: scrollView)
                                
                        }
                    }
                    .scrollTargetBehavior(.paging)
                    .frame(height: 500)
                    .scrollIndicators(.hidden)
                }
            }
            .navigationTitle("Paging Indicator")
        }
    }
}

#Preview {
    ContentView()
}
