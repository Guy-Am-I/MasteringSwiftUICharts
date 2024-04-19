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
        VStack(alignment: .leading) {
            Text("Chart Demo 3")
                .font(.largeTitle)
                .fontWeight(.semibold)
            HStack {
                ChartButtonsView(barColors: $barColors, chartType: $chartType, isVerticalChart: $isVerticalChart)
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
            }
            
        }
        .padding()
    }
}
#Preview {
    AdvancedBarChartView(dailySales: defaultDailySales,
                         min: 0.0,
                         max: 700.0)
}
