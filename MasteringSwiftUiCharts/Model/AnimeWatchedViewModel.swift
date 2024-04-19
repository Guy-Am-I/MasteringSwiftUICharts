//
//  AnimeWatchedViewModel.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-19.
//

import Foundation

import SwiftUI
import Charts

enum AnimeNames: String, Plottable, CaseIterable {
    case demonSlayer = "Demon Slayer"
    case jjk = "Jujutsu Kaisen"
    case hunter = "Hunter Hunter"
    
    var color: Color {
        switch self {
        case .demonSlayer: return Color.aliceBlue
        case .jjk: return Color.mediumPurple
        case .hunter: return Color.orangeRed
        }
    }
}
