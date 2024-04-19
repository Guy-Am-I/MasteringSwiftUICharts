
import SwiftUI
import Charts

struct LineChartVerticalView: View {
    let dailySales: [DailySalesType]
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales))
            }
        }
    }

}

struct LineChartVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartVerticalView(dailySales: defaultDailySales)
    }
}
