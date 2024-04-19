//
//  AdvancedBarChartView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-19.
//

import SwiftUI
import Charts

enum ChartType {
    case bar, line, area
}

struct AdvancedBarChartView: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    @State var barColors: [Color] = defaultBarColors
    @State var chartType: ChartType = .bar
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var isVerticalChart = true
    
    var body: some View {
        VStack {
            Text("Chart Demo 3")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if isVerticalChart {
                switch(chartType) {
                case .bar:
                    BarChartVerticalView(dailySales: dailySales, barColors: barColors)
                case .line:
                    LineChartVerticalView(dailySales: dailySales)
                case .area:
                    AreaChartVerticalView(dailySales: dailySales)
                }
            } else {
                switch(chartType) {
                case .bar:
                    BarChartHorizontalView(dailySales: dailySales, barColors: barColors)
                case .line:
                    LineChartHorizontalView(dailySales: dailySales)
                case .area:
                    AreaChartHorizontalView(dailySales: dailySales)
                }
            }
            
           // Chart Buttons
            HStack {
                
                ColorButtonView(
                    colors: $barColors,
                    dim: 30,
                    offset: 10)

                Spacer()

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

            }
            .padding()
        }
        .padding()
    }
}
#Preview {
    AdvancedBarChartView(dailySales: defaultDailySales,
                          min: 0.0,
                          max: 700.0)
}
