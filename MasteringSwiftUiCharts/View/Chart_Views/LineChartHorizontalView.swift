
import SwiftUI
import Charts

struct LineChartHorizontalView: View {
    let dailySales: [DailySalesType]
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(
                    x: .value("Sales", item.sales),
                    y: .value("Day", item.day))            }
        }
    }
}

struct LineChartHoriontalView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartHorizontalView(dailySales: defaultDailySales)
    }
}
