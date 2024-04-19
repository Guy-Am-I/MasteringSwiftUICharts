//
//  AnimesWatchedModel.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-19.
//

import Foundation
import SwiftUI
import Charts

struct animeData: Hashable {
    var date: Date
    var watched: Int
}

struct AnimesWatchedModel: Identifiable {
    let id = UUID()
    let name: AnimeNames
    var plottableData: [animeData] = []
}

extension Date {
    func adding (_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date? {
        return calendar.date(byAdding: component, value: value, to: self)
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}
