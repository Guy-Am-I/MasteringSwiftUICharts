
import SwiftUI
import Charts

struct BarChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales))
                .foregroundStyle(by: .value("Day", item.day))
            }
        }
        .chartForegroundStyleScale(range: barColors)
    }

}

struct BarChartVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartVerticalView(dailySales: defaultDailySales,
         barColors: defaultBarColors)
    }
}
