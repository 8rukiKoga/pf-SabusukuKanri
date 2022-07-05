import SwiftUI
import WebKit //WebKitをインポート
 
struct WebView: UIViewRepresentable {
    @Binding var url: String
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}
 
struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: .constant("https://8rukikoga.github.io/Portfolio/"))
    }
}
