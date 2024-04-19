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
    @State var chartItem: ChartItem
    
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Chart Demo 3")
                .font(.largeTitle)
                .fontWeight(.semibold)
            HStack {
                ChartButtonsView(barColors: $chartItem.barColors, chartType: $chartItem.chartType, isVerticalChart: $chartItem.isVerticalChart)
                if chartItem.isVerticalChart {
                    switch(chartItem.chartType) {
                    case .bar:
                        BarChartVerticalView(dailySales: chartItem.dailySales, barColors: chartItem.barColors, selectedDay: $chartItem.selectedDay, chartItem.min, chartItem.max)
                    case .line:
                        LineChartVerticalView(dailySales: chartItem.dailySales)
                    case .area:
                        AreaChartVerticalView(dailySales: chartItem.dailySales)
                    }
                } else {
                    switch(chartItem.chartType) {
                    case .bar:
                        BarChartHorizontalView(dailySales: chartItem.dailySales, barColors: chartItem.barColors)
                    case .line:
                        LineChartHorizontalView(dailySales: chartItem.dailySales)
                    case .area:
                        AreaChartHorizontalView(dailySales: chartItem.dailySales)
                    }
                }
            }
            
        }
        .padding()
    }
}
#Preview {
    AdvancedBarChartView(chartItem: ChartItem.defaultChartItem)
}
