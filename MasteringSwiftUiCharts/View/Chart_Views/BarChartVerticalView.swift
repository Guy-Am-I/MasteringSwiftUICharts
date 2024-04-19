
import SwiftUI
import Charts

struct BarChartVerticalView: View {
    @State var dailySales: [DailySalesType]
    let barColors: [Color]
    @Binding var selectedDay: String

    let min: Double
    let max: Double
    @State var isDragging: Bool = false
    var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(dailySales: dailySales, selectedDay: selectedDay)
    }
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales))
                .foregroundStyle(by: .value("Day", item.day))
            }
            if isDragging {
                RuleMarkView(selectedDay: selectedDay, salesOnSelectedDay: salesOnSelectedDay, intMode: true)
            }
        }
        .chartForegroundStyleScale(range: barColors)
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
                            selectedDay = newDay
                            
                            setSalesOfSelectedDay(dailySales: &dailySales, selectedDay: selectedDay, sales: sales, min: min, max: max)
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
        BarChartVerticalView(dailySales: defaultDailySales,
                             barColors: defaultBarColors, selectedDay: .constant("Sun"), min: 0.0, max: 1000.0)
    }
}
