//
//  ArcCircleView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-16.
//

import SwiftUI

struct ArcCircleView: View {
    let color: Color
    let radius: (start: CGFloat, end: CGFloat)
    let trim: (start: CGFloat, end: CGFloat)
    let rotate: CGFloat
    
    @State private var finalTrim: CGFloat = 0
    
    var lineWidth: CGFloat {
        radius.end - radius.start
    }
    var finalRadius: CGFloat {
        radius.end - lineWidth/2
    }
    
    var body: some View {
        Circle()
            .trim(from: trim.start, to: finalTrim)
            .stroke(color,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .rotationEffect(.degrees(rotate))
            .frame(width: finalRadius, height: finalRadius)
            .onAppear() {
                withAnimation() {
                    finalTrim = trim.end
                }
            }
    }
}

#Preview {
    ArcCircleView(color: .aquaMarine, radius: (start: 90, end: 100), trim: (start: 0.25, end: 0.8), rotate: 30)
}
