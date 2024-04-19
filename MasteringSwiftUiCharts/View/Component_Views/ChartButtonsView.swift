//
//  ChartButtonsView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-19.
//

import SwiftUI
import Charts

struct ChartButtonsView: View {
    @Binding var barColors: [Color]
    @Binding var chartType: ChartType
    @Binding var isVerticalChart: Bool
    
    var body: some View {
        VStack {
           Button(action: {
               withAnimation {
                   chartType = .bar
               }
           }, label: {
               Text("BAR")
           })
            Spacer()
            Button(action: {
                withAnimation {
                    chartType = .line
                }
            }, label: {
                Text("LINE")
            })
            Spacer()
            Button(action: {
                withAnimation {
                    chartType = .area
                }
            }, label: {
                Text("AREA")
            })
            Spacer()
            Button(action: {
                withAnimation {
                    isVerticalChart.toggle()
                }
            }, label: {
                Image(systemName: "chart.bar.fill")
                    .rotationEffect(.degrees(isVerticalChart ? 90 : 0))
            })
            Spacer()
            ColorButtonView(
                colors: $barColors,
                dim: 50,
                offset: 10)
            Spacer()

        }
        .padding()
    }
}

#Preview {
    ChartButtonsView(barColors: .constant(defaultBarColors), chartType: .constant(.bar), isVerticalChart: .constant(true))
}
