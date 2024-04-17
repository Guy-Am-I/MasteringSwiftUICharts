//
//  BarChartView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-16.
//

import SwiftUI
import Charts

struct BarChartView: View {
    let xAxisLabel = "Day"
    let yAxisLabel = "Hours"
    let min = 0.0
    let max = 10.0
    
    var body: some View {
        VStack {
            Chart {
                BarMark(x: .value(xAxisLabel, "Sunday"), y: .value(yAxisLabel, 6))
                    .annotation {
                        Image(systemName: "dog")
                    }
                    .foregroundStyle(by: .value(xAxisLabel, "Sunday"))
                BarMark(x: .value(xAxisLabel, "Monday"), y: .value(yAxisLabel, 3))
                    .annotation {
                        Image(systemName: "cat")
                    }
                    .foregroundStyle(by: .value(xAxisLabel, "Monday #1"))
                BarMark(x: .value(xAxisLabel, "Monday"), y: .value(yAxisLabel, 5))
                    .annotation {
                        Image(systemName: "cat")
                    }
                    .foregroundStyle(by: .value(xAxisLabel, "Monday #2"))
                BarMark(x: .value(xAxisLabel, "Tuesday"), y: .value(yAxisLabel, 9))
                    .foregroundStyle(Color.random)
                    .annotation {
                        Image(systemName: "teddybear")
                    }
                BarMark(x: .value(xAxisLabel, "Wednesday"), y: .value(yAxisLabel, 3))
                    .foregroundStyle(Color.random)
                    .annotation(position: .bottom) {
                        Image(systemName: "fish")
                    }
                BarMark(x: .value(xAxisLabel, "Thursday"), y: .value(yAxisLabel, 8))
                    .foregroundStyle(Color.random)
                BarMark(x: .value(xAxisLabel, "Friday"), y: .value(yAxisLabel, 1))
                    .foregroundStyle(Color.random)
                BarMark(x: .value(xAxisLabel, "Saturday"), y: .value(yAxisLabel, 5))
                    .foregroundStyle(Color.random)
            }
            .chartYScale(domain: min...max)
            .chartXAxis {
                AxisMarks(position: .bottom)
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartLegend(position: .top, alignment: .center)
            .padding()
            
        }
    }
}

#Preview {
    BarChartView()
}
