//
//  ArcCircleView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-16.
//

import SwiftUI

struct RandomColoredArcCircleView: View {
    let startTrim = Double.random(in: 0...0.5)
    let rndRotate = Double.random(in: 0...360)
    let colors: [Color]
    let idx: Int
    let radius: (min: CGFloat, max: CGFloat)
    let opacity: CGFloat

    var color: Color {
        colors[0..<colors.count ~= idx ? idx : 0]
    }
    var endRadius: CGFloat {
        radius.min + radius.max / CGFloat(colors.count)
    }
    
    var body: some View {
        ArcCircleView(color: color.opacity(opacity), radius: (start: radius.min, end: radius.max), trim: (start: startTrim, end: 1.0), rotate: rndRotate)
    }
}

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

//#Preview {
//    ArcCircleView(color: .aquaMarine, radius: (start: 90, end: 100), trim: (start: 0.25, end: 0.8), rotate: 30)
//}

#Preview {
    RandomColoredArcCircleView(colors: Color.defaultColors, idx: 8, radius: (min: 160, max: 180), opacity: 0.5)
}
