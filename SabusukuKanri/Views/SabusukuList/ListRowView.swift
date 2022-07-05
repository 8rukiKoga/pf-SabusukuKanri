
import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        HStack {
            ZStack {
                Color(.gray)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Image(systemName: item.image)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .fontWeight(.bold)
                Text("\(listViewModel.getCycle(itemCycle: item.updateCycle))")
                    .foregroundColor(.white)
                    .font(.caption)
            }
            
            Spacer()
            
            // タップされたら年額を表示
            if let yearlyItemFee = listViewModel.getMonthlyFee(itemFee: item.fee, itemCycle: item.updateCycle) * 12 {
                Text(item.isMonthly ? "¥\(item.fee)" : "¥\(yearlyItemFee)(年額)")
                    .fontWeight(.bold)
            }
        }
        .listRowBackground(Color(listViewModel.themeColor))
        .listRowSeparatorTint(Color.white.opacity(0.5))
        .foregroundColor(Color.white)
        .padding(.vertical, 15)
        .padding(.horizontal, 5)
    }
}

struct ListRowView_Previews: PreviewProvider {
    // プレビューのために初期値設定
    static var item1 = ItemModel(image: "house.fill", title: "First item!", fee: 2, updateCycle: 1, isMonthly: true)
    static var item2 = ItemModel(image: "circle.circle", title: "Second Item", fee: 2, updateCycle: 1, isMonthly: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        .environmentObject(ListViewModel())
    }
}
