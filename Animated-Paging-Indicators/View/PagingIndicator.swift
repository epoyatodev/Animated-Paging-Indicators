//
//  PagingIndicator.swift
//  Animated-Paging-Indicators
//
//  Created by enrique.poyato on 8/3/24.
//

import SwiftUI

struct PagingIndicator: View {
    var activeTint: Color = .primary
    var body: some View {
        GeometryReader {
            let width = $0.size.width
            
            if let scrollViewWidth = $0.bounds(of: .scrollView(axis: .horizontal))?.width, scrollViewWidth > 0 {
                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                let totalPages = Int(width/scrollViewWidth)
                let freeProgress = -minX / scrollViewWidth
                
                let activeIndex = Int(freeProgress)
                let nextIndex = Int(freeProgress.rounded(.awayFromZero))
                let indicatorProgress = freeProgress - CGFloat(activeIndex)
                
                let currentPageWidth = 18 - (indicatorProgress * 18)
                let nextPageWidth = indicatorProgress * 18
                
                HStack(spacing: 10) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Capsule()
                            .fill(activeTint)
                            .frame(width: 8 + (activeIndex == index ? currentPageWidth : nextIndex == index ? nextPageWidth : 0), height: 8)
                            .onTapGesture {
                                
                            }
                    }
                }
                .frame(width: scrollViewWidth)
                .offset(x: -minX)
            }
            
        }
        .frame(height: 30)
    }
}

#Preview {
    ContentView()
}
