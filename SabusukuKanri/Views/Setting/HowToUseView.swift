
import SwiftUI

struct HowToUseView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ScrollView {
            HStack {
                Text("①：サブスクを登録する")
                    .font(.title3)
                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    Image("Add1")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                        .padding(.horizontal)
                    Image("Add2")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                    Image("Add3")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                        .padding(.horizontal)
                }
                .padding()
            }
            
            HStack {
                Text("②：サブスクを管理する")
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    Image("Manage1")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                        .padding(.horizontal)
                    Image("Manage2")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                    Image("Manage3")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                        .padding(.horizontal)
                    Image("Manage4")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                }
                .padding()
            }
            
            HStack {
                Text("③：サブスクを分析する")
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    Image("Analyze1")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                        .padding(.horizontal)
                    Image("Analyze2")
                        .resizable()
                        .frame(width: 200, height: 375)
                        .cornerRadius(5)
                }
                .padding()
            }
            
        }
        .navigationTitle("How To Use")
    }
}

struct HowToUseView_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseView()
            .environmentObject(ListViewModel())
    }
}
