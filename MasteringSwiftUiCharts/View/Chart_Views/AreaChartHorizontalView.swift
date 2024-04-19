

import SwiftUI
import Charts

struct AreaChartHorizontalView: View {
    let dailySales: [DailySalesType]
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                AreaMark(
                    x: .value("Sales", item.sales),
                    y: .value("Day", item.day))            }
        }
    }

}

struct AreaChartHoriontalView_Previews: PreviewProvider {
    static var previews: some View {
        AreaChartHorizontalView(dailySales: defaultDailySales)
    }
}
