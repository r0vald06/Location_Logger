//
//  ItemStore.swift
//  Location_Logger
//
//  Created by raudel Valdes on 12/2/18.
//  Copyright © 2018 Raudel Valdes. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    @discardableResult func createItem()  -> Item  { //Apply @discardableResult to a function or method
                                                    //declaration to suppress the compiler warning
                                                    //when the function or method that returns a value
                                                    //is called without using its result.
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return  newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return }
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        // Remove item from array
        allItems.remove(at: fromIndex)
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
//    func updateItem(_ item: Item, ){
//        self.removeItem(<#T##item: Item##Item#>)
//        self.createItem()
//        self.moveItem(from: <#T##Int#>, to: <#T##Int#>)
//    }
}
