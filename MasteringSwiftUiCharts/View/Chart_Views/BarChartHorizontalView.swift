//
//  BarChartHoriontalView.swift
//  Charts Demo 3
//
//  Created by Ron Erez on 12/31/22.
//

import SwiftUI
import Charts

struct BarChartHorizontalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(
                    x: .value("Sales", item.sales),
                    y: .value("Day", item.day))
                .foregroundStyle(by: .value("Day", item.day))            }
        }
        .chartForegroundStyleScale( range: barColors)
    }
}

struct BarChartHoriontalView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartHorizontalView(
            dailySales: defaultDailySales,
        barColors: defaultBarColors)
    }
}
