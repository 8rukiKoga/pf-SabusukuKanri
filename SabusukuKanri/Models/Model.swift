
import SwiftUI
import Foundation

//Immutable Struct

struct ItemModel: Identifiable, Codable {
    let id: String
    let image: String
    let title: String
    let fee: Int
    let updateCycle: Int
    let isMonthly:Bool
    
    init(id: String = UUID().uuidString, image: String, title: String, fee: Int, updateCycle: Int, isMonthly: Bool) {
        self.id = id
        self.image = image
        self.title = title
        self.fee = fee
        self.updateCycle = updateCycle
        self.isMonthly = isMonthly
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, image: image, title: title, fee: fee, updateCycle: updateCycle, isMonthly: !isMonthly)
    }
    
}
