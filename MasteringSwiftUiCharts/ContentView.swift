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
        NavigationStack {
            ZStack {
                Color.blanchedAlmond.opacity(0.3).ignoresSafeArea()
                VStack(alignment: .leading) {
                    Spacer()
                    NavigationLink(destination: LineChartView(data: getAnimeModelTestData())) {
                        HStack() {
                            ColorButtonView(colors: $colorsBar, dim: 100, offset: 15)
                            Text("Line")
                                .font(.largeTitle)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.sandyBrown)
                            Spacer()
                        }
                    }
                    Spacer()
                    NavigationLink(destination: BarChartView()) {
                        HStack() {
                            ColorButtonView(colors: $colorsPie, dim: 100, offset: 15)
                            Text("Advanced Bar Chart")
                                .font(.largeTitle)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.darkGoldenRod)
                        }
                    }
                    Spacer()
                    NavigationLink(destination: BarChartView()) {
                        HStack() {
                            ColorButtonView(colors: $colorsGraph, dim: 100, offset: 15)
                            Text("Bar")
                                .font(.largeTitle)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.mediumVioletRed)
                        }
                    }
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack {
                            let chartTypes = ["Bar", "Line", "Area", "Scatter", "Heat", "Pie"]
                            ForEach(chartTypes, id: \.self) { name in
                                ZStack {
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.blue)
                                    Text(name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                                .frame(width: 80, height: 150)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .navigationTitle("Having fun with Charts")
            }
        }
    }
}

#Preview {
    ContentView()
}
