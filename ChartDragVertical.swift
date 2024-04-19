//
//  ChartDragVertical.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-19.
//

import Foundation
import SwiftUI

struct ChartDragVertical: ViewModifier {
    @Binding var chartModel: ChartItem
    @Binding var isDragging: Bool
    
    func body(content: Content) -> some View {
        content
        .chartOverlay { outer in
            GeometryReader { inner in
                Rectangle()
                    .fill(.white.opacity(0))
                    .contentShape(Rectangle())
                    .gesture(DragGesture()
                        .onChanged { val in
                            isDragging = true
                            let location = val.location
                            let (newDay, sales) = outer.value(at: location, as: (String, Double).self) ?? ("error", -1)
                            chartModel.selectedDay = newDay
                            
                            setSalesOfSelectedDay(dailySales: &chartModel.dailySales, selectedDay: chartModel.selectedDay, sales: sales, min: chartModel.min, max: chartModel.max)
                        }
                        .onEnded({ val in
                            isDragging = false
                        }))
            }
        }
    }
}
