//
//  ChartView.swift
//  SabusukuKanri
//
//  Created by 古賀遥貴 on 2022/07/05.
//

import SwiftUI

struct ChartView: View {
    @EnvironmentObject var vm: ListViewModel
    
    var body: some View {
        HStack(spacing: 3) {
            Spacer()
            ForEach(vm.items) { item in
                ZStack {
                    if let monthlyFee = vm.getMonthlyFee(itemFee: item.fee, itemCycle: item.updateCycle) {
                        Rectangle()
                            .frame(width: CGFloat(vm.getFeePercentage(itemFee: monthlyFee)) * 3,
                                   height: 50)
                            .foregroundColor(.blue)
                        // 頭3文字を表示
                        Text(item.title.prefix(3))
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                    }
                }
            }
            Spacer()
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .environmentObject(ListViewModel())
    }
}
