
import SwiftUI

struct AnalyticsRowView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    let item: ItemModel
    
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            
            if let monthlyFee = listViewModel.getMonthlyFee(itemFee: item.fee, itemCycle: item.updateCycle) {
                Text("\(listViewModel.getFeePercentage(itemFee: monthlyFee))%")
            }
        }
        .listRowSeparatorTint(Color(listViewModel.themeColor))
    }
}

struct AnalyticsRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(image: "house.fill",title: "First item!", fee: 500, updateCycle: 1, isMonthly: true)
    static var item2 = ItemModel(image: "circle.circle", title: "Second Item", fee: 1000, updateCycle: 3, isMonthly: false)
    
    static var previews: some View {
        Group {
            AnalyticsRowView(item: item1)
            AnalyticsRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        .environmentObject(ListViewModel())
    }
}
