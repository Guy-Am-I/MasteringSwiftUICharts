//
//  ColorButtonView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-16.
//

import SwiftUI

struct ColorButtonView: View {
    @State var colors: [Color]
    let dim: CGFloat
    let offset: CGFloat
    
    let action: () -> Void
    @State private var flip: Bool = false
    
    var count: CGFloat {
        CGFloat(colors.count)
    }
    var factor: CGFloat {
        (dim - offset) / count
    }
    
    func minRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i) + offset
    }
    
    func maxRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i + 1) + offset
    }
    
    var body: some View {
        ZStack {
            ForEach(0 ..< colors.count, id: \.self) { i in
                RandomColoredArcCircleView(colors: Color.defaultColors, idx: i, radius: (min: minRadius(i: i, offset: offset), max: maxRadius(i: i, offset: offset)), opacity: 0.8)
            }
            
            Circle()
                .stroke(colors.last ?? .black, lineWidth: factor)
                .frame(width: dim, height: dim)
        }
        .rotation3DEffect(
            flip ? .zero : .degrees(180),
            axis: (x: Double.random(in: -1...1),
                   y: Double.random(in: -1...1), z: 0)
        )
        .onTapGesture {
            colors = Color.randomColorsN(n: colors.count)
            withAnimation {
                flip.toggle()
            }
            
            action()
        }
    }
}

#Preview {
    ColorButtonView(colors: Color.defaultColors, dim: 180, offset: 60, action: {})
}
