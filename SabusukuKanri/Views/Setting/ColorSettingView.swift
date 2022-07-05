
import SwiftUI

struct ColorSettingView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var colorSet: [String] = [
        "ThemeColor1", "ThemeColor2", "ThemeColor3", "ThemeColor4", "ThemeColor5", "ThemeColor6", "ThemeColor7", "ThemeColor8", "ThemeColor9", "ThemeColor10"
    ]
    
    var body: some View {
        VStack  {
            VStack(spacing: 100) {
                
                Color(listViewModel.themeColor)
                    .frame(width: 230, height: 80)
                    .cornerRadius(13)
                
                VStack {
                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 0), count: 5), spacing: 0, content: {
                        ForEach(0..<colorSet.count) { item in
                            Button {
                                listViewModel.themeColor = colorSet[item]
                            } label: {
                                Color(colorSet[item])
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .padding()
                            }
                        }
                    })
                }
                .padding(.horizontal, 30)
                .navigationTitle("Color Setting")
            }
        }
    }
}

struct ColorSettingView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSettingView()
            .environmentObject(ListViewModel())
    }
}
