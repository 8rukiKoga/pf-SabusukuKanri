
import Foundation
import SwiftUI

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    @AppStorage("theme_color") var themeColor = "ThemeColor1"
    @Published var backgroundColor = Color("ViewBackgroundColor")
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(image: String, title: String, fee: Int, updateCycle: Int) {
        let newItem = ItemModel(image: image, title: title, fee: fee, updateCycle: updateCycle, isMonthly: true)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func getMonthlyFee(itemFee: Int, itemCycle: Int) -> Int {
        var monthlyFee = itemFee
        
        if itemCycle == 1 {
            monthlyFee *= 4
        } else if itemCycle == 2 {
            monthlyFee *= 2
        } else if itemCycle == 4 {
            monthlyFee /= 2
        } else if itemCycle == 5 {
            monthlyFee /= 3
        } else if itemCycle == 6 {
            monthlyFee /= 6
        } else if itemCycle == 7 {
            monthlyFee /= 12
        }
        else if itemCycle == 8 {
            monthlyFee /= 24
        }
        return monthlyFee
    }
    
    func getTotalFee() -> Int {
        var itemCount = items.count
        itemCount -= 1
        var itemFee = 0
        
        while 0 <= itemCount {
            
            let monthlyFee = getMonthlyFee(itemFee: items[itemCount].fee, itemCycle: items[itemCount].updateCycle)
            itemFee += monthlyFee
            
            itemCount -= 1
        }
        return itemFee
    }
    
    func getFeePercentage(itemFee: Int) -> Int {
        if getTotalFee() > 0 {
            let totalFee = getTotalFee()
            var calcedItemFee = itemFee
            calcedItemFee = calcedItemFee * 100 / totalFee
            return calcedItemFee
        } else { return 0 }
    }
    
    func getCycle(itemCycle: Int) -> String {
        if itemCycle == 1 {
            return "1週間"
        } else if itemCycle == 2 {
            return "2週間"
        } else if itemCycle == 3 {
            return "1ヶ月"
        } else if itemCycle == 4 {
            return "2ヶ月"
        } else if itemCycle == 5 {
            return "3ヶ月"
        } else if itemCycle == 6 {
            return "6ヶ月"
        } else if itemCycle == 7 {
            return "1年"
        } else if itemCycle == 8 {
            return "2年"
        } else { return "error" }
    }
}
