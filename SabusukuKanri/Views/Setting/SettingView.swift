
import SwiftUI
import StoreKit

struct SettingView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var showSheet: Bool = false
    
    @State private var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    @State var url: String = "https://8rukikoga.github.io/Portfolio/"
    
    var body: some View {
        
        NavigationView {
            ZStack {
                listViewModel.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    List {
                        Section(header: Text("アプリの設定")) {
                            NavigationLink("テーマカラーを変更する", destination: ColorSettingView())
                            
                            Button {
                                showAlert.toggle()
                                
                            } label: {
                                Text("リストをまとめて削除する")
                                    .foregroundColor(.red)
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("警告"),
                                      message: Text("登録されたサブスクリプションがすべて削除されますが、よろしいですか？"),
                                      primaryButton: .default(Text("戻る"), action: {
                                    return
                                }),
                                      secondaryButton: .destructive(Text("削除"), action: {
                                    listViewModel.items.removeAll()
                                })
                                )}
                        }
                        Section(header: Text("サポート")) {
                            Button {
                                reviewApp()
                            } label: {
                                Text("さぶすく管理 を評価する")
                            }
                            Button {
                                url = "https://sgfm.jp/f/e382c06eaa099e6249d6b5b10406c72b"
                                showSheet.toggle()
                            } label: {
                                Text("不具合・リクエストを送信する")
                            }
                            .sheet(isPresented: $showSheet) {
                                WebView(url: $url)
                            }
                        }
                        
                        Section(header: Text("開発者の他のサービス")) {
                            Button {
                                seeApp()
                            } label: {
                                HStack {
                                    Image("25minsLogo")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(12)
                                        .padding(5)
                                    
                                    VStack(alignment: .leading) {
                                        Text("25mins.")
                                        Text("作業を記録できるポロモードタイマーアプリ")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 10))
                                    }
                                    .padding(.leading, 2)
                                }
                            }
                        }
                        
                        Section(header: Text("このアプリについて")) {
                            NavigationLink("アプリの使い方", destination: HowToUseView())

                            Button {
                                url = "https://8rukikoga.github.io/Portfolio/"
                                showSheet.toggle()
                            } label: {
                                Text("開発者はどんな人？")
                            }
                            .sheet(isPresented: $showSheet) {
                                WebView(url: $url)
                            }
                            
                            HStack {
                                Text("バージョン")
                                Spacer()
                                Text("1.3")
                            }
                            Button {
                                url = "https://8rukikoga.github.io/Portfolio/SabusukuKanri.html"
                                showSheet.toggle()
                            } label: {
                                Text("プライバシーポリシー")
                            }
                            .sheet(isPresented: $showSheet) {
                                WebView(url: $url)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    // レビューアラート表示
    func reviewApp(){
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    // appstoreを開く
    func seeApp(){
        let productURL:URL = URL(string: "https://apps.apple.com/us/app/25mins/id1610981086?itsct=apps_box_link&itscg=30200")!
        UIApplication.shared.open(productURL)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(ListViewModel())
    }
}
