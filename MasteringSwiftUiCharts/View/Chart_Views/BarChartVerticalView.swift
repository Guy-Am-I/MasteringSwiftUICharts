
import SwiftUI
import Charts


struct BarChartVerticalView: View {
    
    @Binding var chartItem: ChartItem
    var min: Double {
        chartItem.min
    }
    var max: Double {
        chartItem.max
    }

    @State var isDragging: Bool = false
    var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(dailySales: chartItem.dailySales, selectedDay: chartItem.selectedDay)
    }
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales))
                .foregroundStyle(by: .value("Day", item.day))
            }
            if isDragging {
                RuleMarkView(selectedDay: chartItem.selectedDay, salesOnSelectedDay: salesOnSelectedDay, intMode: true)
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColors)
        .chartYScale(domain: min...max)
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
                            chartItem.selectedDay = newDay
                            
                            setSalesOfSelectedDay(dailySales: &chartItem.dailySales, selectedDay: chartItem.selectedDay, sales: sales, min: min, max: max)
                        }
                        .onEnded({ val in
                            isDragging = false
                        }))
            }
        }
        .padding()
    }

}

struct BarChartVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartVerticalView(chartItem: .constant(ChartItem.defaultChartItem))
    }
}
