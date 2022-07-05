
import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Binding var choosedImage: String
    @Binding var textFieldText: String
    @Binding var textFieldInt: Int
    @Binding var updateCycle: Int
    @Binding var showSheet: Bool
    
    // アイコンリスト
    @State var icons = [
        "music.note", "headphones",
        "film.fill", "tv.fill", "play.tv", "play.fill",
        "book.fill", "book.closed.fill", "books.vertical.fill", "bookmark.fill",
        "house.fill", "trash.fill", "iphone.rear.camera", "wifi", "network", "antenna.radiowaves.left.and.right",
        "bicycle", "scooter", "figure.walk", "car.fill", "bus.fill", "tram.fill", "ferry.fill", "train.side.front.car", "airplane",
        "sun.min.fill", "cloud.fill", "cloud.rain.fill", "umbrella.fill", "moon.fill", "bolt.fill", "snowflake", "sparkles",
        "house.fill", "tshirt.fill", "creditcard.fill", "bag.fill", "gift.fill", "shippingbox.fill", "phone.fill", "gamecontroller.fill", "fork.knife", "cup.and.saucer.fill",
        "pawprint.fill", "hare.fill", "tortoise.fill", "ladybug.fill", "ant.fill",
        "folder.fill", "note.text", "doc.fill", "keyboard.fill", "highlighter",
        "yensign.circle.fill", "dollarsign.circle.fill", "eurosign.circle.fill", "wonsign.circle.fill", "bitcoinsign.circle.fill",
        "circle.circle", "heart.fill", "cross.circle.fill", "hourglass.tophalf.filled", "leaf.fill", "flag.2.crossed.fill", "bell.fill", "camera.fill", "suitcase.fill", "lock.fill", "pin.fill", "shield.fill", "lightbulb.fill", "battery.100.bolt", "bubble.middle.bottom.fill",  "waveform", "flame.fill",
        "person.fill", "figure.stand", "figure.roll", "figure.stand.line.dotted.figure.stand", "eyes", "nose", "mouth", "ear", "brain", "hand.raised.fill"
    ]
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @FocusState var focused: Bool
    
    var body: some View {
        
        ZStack {
            listViewModel.backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Form {
                    Section(header: Text("アイコン")) {
                        HStack {
                            Spacer()
                            VStack {
                                ZStack {
                                    Color(.gray)
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .clipShape(Circle())
                                    
                                    // Pickerで選ばれたアイコンを表示
                                    Image(systemName: choosedImage)
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                }
                                Text("▲")
                                    .font(.system(size: 10))
                                
                                // Picker
                                Picker("", selection: $choosedImage) {
                                    ForEach(0..<icons.count) { index in
                                        Image(systemName: icons[index])
                                            .tag(icons[index])
                                            .frame(alignment: .center)
                                    }
                                }
                                .padding()
                                .background(.cyan)
                                .clipShape(Circle())
                                .pickerStyle(MenuPickerStyle())
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical, 7)
                    .padding(.bottom, 3)
                    
                    Section(header: Text("サブスク名")) {
                        TextField("サブスク名を入力...", text: $textFieldText)
                            .submitLabel(.done)
                    }
                    
                    Section(header: Text("料金")) {
                        HStack {
                            Spacer()
                            Button {
                                focused.toggle()
                            } label: {
                                Text("キーボードを閉じる")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    .fontWeight(.thin)
                            }
                        }
                        HStack {
                            TextField("サブスク料金を入力...", value: $textFieldInt, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .focused($focused)
                            
                            Spacer()
                            Text("円")
                        }
                    }
                    .listRowSeparatorTint(Color.white.opacity(0.5))
                    
                    Section(header: Text("支払い周期")) {
                        Picker("", selection: $updateCycle) {
                            Text("1週間に1回").tag(1)
                            Text("2週間に1回").tag(2)
                            
                            Text("1ヶ月に1回").tag(3)
                            Text("2ヶ月に1回").tag(4)
                            Text("3ヶ月に1回").tag(5)
                            Text("6ヶ月に1回").tag(6)
                            
                            Text("1年に1回").tag(7)
                            Text("2年に1回").tag(8)
                        }
                        .pickerStyle(InlinePickerStyle())
                    }
                    Section {
                        Button(action: {
                            saveButtonPressed()
                        }, label: {
                            Text("追加" .uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                        })
                    }
                    .listRowBackground(Color.accentColor)
                }
            }
            // アラート表示
            .alert(isPresented: $showAlert, content: getAlert)
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() == true {
            listViewModel.addItem(image: choosedImage,title: textFieldText, fee: textFieldInt, updateCycle: updateCycle)
            // 追加が完了したらシートを閉じる
            showSheet.toggle()
        }
    }
    
    // テキストは3文字必要とアラートを出す
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "サブスク名は3文字以上必要です。 🙇🏻‍♂️"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
}

//struct AddItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddItemView(textFieldText: .constant("Custom Title"), textFieldInt: .constant(980), updateCycle: .constant(1), showSheet: .constant(true))
//            .environmentObject(ListViewModel())
//    }
//}
