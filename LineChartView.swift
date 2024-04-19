//
//  GraphChartView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-19.
//

import SwiftUI
import Charts

struct LineChartView: View {
    let data : [AnimesWatchedModel]
    var body: some View {
        ZStack {
            Color
                .skyBlue
                .opacity(0.4)
                .ignoresSafeArea()
            VStack {
                Text("# Episodes Watched per Week")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Chart {
                    ForEach(data) { anime in
                        ForEach(anime.plottableData, id: \.self) {
                            LineMark(x: .value("Weekday", $0.date),
                                     y: .value("Episodes", $0.watched))
                            .foregroundStyle(anime.name.color)
                            .interpolationMethod(.catmullRom)
                            .lineStyle(.init(lineWidth: 2))
                            .symbol {
                                Circle()
                                    .fill(anime.name.color)
                                    .frame(width: 15, height: 15)
                                    
                            }
                            .foregroundStyle(by: .value("Plot", anime.name))
                        }
                    }
                }
                .chartXAxis {
                    AxisMarks(preset: .extended, values: .stride (by: .month)) { value in
                        AxisValueLabel(format: .dateTime.month())
                    }
                }
                .chartYAxis {
                    AxisMarks(preset: .extended, position: .leading, values: .stride(by: 5))
                }
            }
            .padding()
        }
    }
}

func getAnimeModelTestData() -> [AnimesWatchedModel] {
    let startDate = Date().startOfDay.adding(.month, value: -10)!
    var sampleData: [AnimesWatchedModel] = [
        .init(name: .demonSlayer),
        .init(name: .jjk),
        .init(name: .hunter)
    ]
    sampleData.indices.forEach {
        for i in 0..<10 {
            let episodes = Int.random(in: 5..<40)
            sampleData[$0].plottableData.append(.init(
                date: startDate.adding(.month, value: i)!,
                watched: episodes))
        }
    }
    return sampleData
}

#Preview {
    return LineChartView(data: getAnimeModelTestData())
}
