
import SwiftUI

struct AnalyticsView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            
            ZStack {
                listViewModel.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    List {
                        Section(header: Text("合計")) {
                            HStack {
                                Text("登録サービス数")
                                Spacer()
                                if let totalCount = listViewModel.items.count {
                                    Text("\(totalCount)")
                                }
                            }
                            .padding()
                            HStack {
                                Text("月額合計")
                                Spacer()
                                if let monthlySum = listViewModel.getTotalFee() {
                                    Text("¥\(monthlySum)")
                                }
                            }
                            .padding()
                            HStack{
                                Text("年額合計")
                                Spacer()
                                if let yearlySum = listViewModel.getTotalFee() * 12 {
                                    Text("¥\(yearlySum)")
                                }
                            }
                            .padding()
                        }
                        .listRowSeparatorTint(Color(listViewModel.themeColor))
                        
                        Section(header: Text("料金の内訳")) {
                            ChartView()
                                .padding(.vertical, 20)
                            
                            ForEach(listViewModel.items) { item in
                                AnalyticsRowView(item: item)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Analytics")
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
            .environmentObject(ListViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}
