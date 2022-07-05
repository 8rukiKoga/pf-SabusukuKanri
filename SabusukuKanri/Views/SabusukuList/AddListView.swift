
import SwiftUI

struct AddListView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var choosedImage: String = "circle.circle"
    @State var textFieldText: String = ""
    @State var textFieldInt: Int = 500
    @State var updateCycle = 3
    @State var showSheet = false
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    struct AddList {
        let image: String
        let name: String
        let fee: Int
        let updateCycle: Int
        
        init(image: String, name: String, fee: Int, updateCycle: Int) {
            self.image = image
            self.name = name
            self.fee = fee
            self.updateCycle = updateCycle
        }
    }
    
    // テンプレートリスト
    var addItems: [AddList] = [
        AddList(image: "film.fill", name: "NETFLIX", fee: 990, updateCycle: 3),
        AddList(image: "film.fill", name: "hulu", fee: 1026, updateCycle: 3),
        AddList(image: "play.tv", name: "dアニメストア", fee: 440, updateCycle: 3),
        AddList(image: "play.fill", name: "YouTube Premium", fee: 1180, updateCycle: 3),
        AddList(image: "shippingbox.fill", name: "Amazon Prime", fee: 500, updateCycle: 3),
        AddList(image: "music.note", name: "Apple Music", fee: 980, updateCycle: 3),
        AddList(image: "music.note", name: "Spotify", fee: 980, updateCycle: 3),
        AddList(image: "music.note", name: "LINE Music", fee: 980, updateCycle: 3),
        AddList(image: "book.fill", name: "Kindle Unlimited", fee: 980, updateCycle: 3),
        AddList(image: "headphones", name: "Audible", fee: 1500, updateCycle: 3),
        AddList(image: "gamecontroller.fill", name: "Switch Online", fee: 306, updateCycle: 3),
        AddList(image: "gamecontroller.fill", name: "PlayStation Plus", fee: 850, updateCycle: 3),
        AddList(image: "flame.fill", name: "Discord Nitro", fee: 1100, updateCycle: 3),
        AddList(image: "cloud.fill", name: "Dropbox", fee: 1200, updateCycle: 3),
        AddList(image: "note.text", name: "Evernote", fee: 680, updateCycle: 3),
        AddList(image: "bubble.middle.bottom.fill", name: "Slack", fee: 850, updateCycle: 3),
        AddList(image: "folder.fill", name: "Adobe CC", fee: 4980, updateCycle: 3),
        AddList(image: "creditcard.fill", name: "American Express", fee: 13200, updateCycle: 7),
        AddList(image: "leaf.fill", name: "bloomee", fee: 880, updateCycle: 3),
        AddList(image: "tram.fill", name: "交通費", fee: 5000, updateCycle: 3),
        AddList(image: "wifi", name: "WiFi", fee: 4000, updateCycle: 3),
        AddList(image: "iphone.rear.camera", name: "スマホ料金", fee: 7000, updateCycle: 3),
        AddList(image: "house.fill", name: "家賃", fee: 50000, updateCycle: 3),
    ]
    
    var body: some View {
        ZStack {
            listViewModel.backgroundColor.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                // カスタムサブスク作成
                Button(action: {
                    textFieldText = ""
                    textFieldInt = 0
                    updateCycle = 3
                    showSheet.toggle()
                }, label : {
                    Text("カスタム")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary)
                        .cornerRadius(14)
                        .padding(.bottom, 5)
                })
                    .sheet(isPresented: $showSheet) {
                        AddItemView(choosedImage: $choosedImage, textFieldText: $textFieldText, textFieldInt: $textFieldInt, updateCycle: $updateCycle, showSheet: $showSheet)
                    }
                
                Divider()
                
                Text("テンプレート")
                    .fontWeight(.bold)
                    .padding(.bottom, 15)
                
                // テンプレをループ表示
                ForEach(0..<addItems.count) { item in
                    Button(action: {
                        choosedImage = addItems[item].image
                        textFieldText = addItems[item].name
                        textFieldInt = addItems[item].fee
                        updateCycle = addItems[item].updateCycle
                        showSheet.toggle()
                    }, label : {
                        HStack() {
                            ZStack {
                                Color(listViewModel.themeColor)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                Image(systemName: addItems[item].image)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                            Text(addItems[item].name)
                                .padding(.leading, 5)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(14)
                        .padding(.bottom, 5)
                    })
                        .sheet(isPresented: $showSheet) {
                            AddItemView(choosedImage: $choosedImage, textFieldText: $textFieldText, textFieldInt: $textFieldInt, updateCycle: $updateCycle, showSheet: $showSheet)
                        }
                }
            }
            .padding(14)
        }
        .navigationTitle("Add")
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddListView()
                    .environmentObject(ListViewModel())
            }
            .preferredColorScheme(.light)
            
            NavigationView {
                AddListView()
                    .environmentObject(ListViewModel())
            }
            .preferredColorScheme(.dark)
        }
        
    }
}

