//
//  RuleMarkView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-19.
//

import SwiftUI
import Charts

struct RuleMarkView: ChartContent {
    let selectedDay: String
    let salesOnSelectedDay: Double
    let intMode: Bool
    var precision: Int {
        intMode ? 0 : 1
    }
    var specifier: String {
        "%.\(precision)f"
    }
    let lineColor = Color.rosyBrown
    var body: some ChartContent {
        RuleMark(y: .value("Sales", salesOnSelectedDay))
            .foregroundStyle(lineColor)
            .lineStyle(.init(lineWidth: 2, dash: [5]))
            .annotation(position: .topTrailing, spacing: 0) {
                Text("\(salesOnSelectedDay, specifier: specifier)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
    }
}
//
//#Preview {
//    RuleMarkView(selectedDay: "Sun", salesOnSelectedDay: 500, intMode: false)
//}
