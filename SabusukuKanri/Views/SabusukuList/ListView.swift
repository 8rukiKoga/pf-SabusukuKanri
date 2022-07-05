
import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                listViewModel.backgroundColor.edgesIgnoringSafeArea(.all)
                
                ZStack {
                    // リストが空の場合はNoItemsViewを表示
                    if listViewModel.items.isEmpty {
                        NoItemsView()
                            .transition(AnyTransition.opacity
                                            .animation(.easeIn))
                    } else {
                        VStack {
                            List {
                                ForEach(listViewModel.items) { item in
                                    ListRowView(item: item)
                                        .onTapGesture {
                                            withAnimation(.linear) {
                                                listViewModel.updateItem(item: item)
                                            }
                                        }
                                }
                                .onDelete(perform: listViewModel.deleteItem)
                                .onMove(perform: listViewModel.moveItem)
                            }
                            .listStyle(InsetGroupedListStyle())
                            SumView()
                        }
                    }
                }
                .navigationTitle("All")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink(destination: AddListView()) {
                        Image(systemName: "plus")
                    }
                )
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}
