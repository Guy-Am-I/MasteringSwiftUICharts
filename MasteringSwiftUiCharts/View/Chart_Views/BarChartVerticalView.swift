
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
        .modifier(ChartDragVertical(chartModel: $chartItem, isDragging: $isDragging))
        .padding()
    }

}

struct BarChartVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartVerticalView(chartItem: .constant(ChartItem.defaultChartItem))
    }
}
