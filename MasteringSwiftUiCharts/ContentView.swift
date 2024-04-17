//
//  ContentView.swift
//  MasteringSwiftUiCharts
//
//  Created by Guy Steinberg on 2024-04-16.
//

import SwiftUI

struct ContentView: View {
    @State private var colorsBar = Color.randomColorsN(n: 10)
    @State private var colorsPie = Color.randomColorsN(n: 10)
    @State private var colorsGraph = Color.randomColorsN(n: 10)
    var body: some View {
        ZStack {
            Color.random.opacity(0.3).ignoresSafeArea()
            NavigationStack {
                Image(systemName: "cat")
                .navigationTitle("Having fun with Charts")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack() {
                            ColorButtonView(colors: $colorsBar, dim: 40, offset: 15, action: {})
                            Text("Graph")
                                .font(.title3)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        HStack() {
                            ColorButtonView(colors: $colorsPie, dim: 40, offset: 15, action: {})
                            Text("Pie")
                                .font(.title3)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack() {
                            ColorButtonView(colors: $colorsGraph, dim: 40, offset: 15, action: {})
                            Text("Bar")
                                .font(.title3)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
