//
//  ChartItem.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-19.
//

import Foundation
import SwiftUI

struct ChartItem: Identifiable {
    let id = UUID()
    var dailySales: [DailySalesType]
    var barColors: [Color]
    var selectedDay: String
    var min: Double
    var max: Double
    var title: String
    var chartType: ChartType
    var isVerticalChart: Bool
    
    static let defaultChartItem: ChartItem = .init(dailySales: defaultDailySales, barColors: defaultBarColors, selectedDay: "Tues", min: 0, max: 1000, title: "Gambare!", chartType: .bar, isVerticalChart: true)
}

