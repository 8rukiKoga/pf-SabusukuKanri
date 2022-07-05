
import SwiftUI

struct ContentView: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        TabView{
            
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet.indent")
                }
            AnalyticsView()
                .tabItem {
                    Image(systemName: "sparkle.magnifyingglass")
                }
            
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ListViewModel())
    }
}
