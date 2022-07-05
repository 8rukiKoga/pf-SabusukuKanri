
import SwiftUI

struct SumView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State var isMonthlySum: Bool = true
    
    var body: some View {
        // ボタンを押すと月額・年額を切り替え
        Button(action: {
            isMonthlySum.toggle()
        }) {
            let yearlySum = listViewModel.getTotalFee() * 12
            HStack {
                Text("総額：")
                Spacer()
                Text(isMonthlySum ? "¥\(listViewModel.getTotalFee())" : "¥\(yearlySum)")
                Text(isMonthlySum ? "(月額)" : "(年額)")
            }
        }
        .foregroundColor(Color.black)
        .font(.subheadline)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .padding(.horizontal)
        .background(Color("SumBackgroundColor"))
        .padding(.bottom, 3)
    }
}
