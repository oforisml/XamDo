//
//  ListViewModel.swift
//  ToDo-MVVM
//
//  Created by Samuel Ofori on 1/16/22.
//

import Foundation
import UIKit

class ListViewModel: ObservableObject{
    @Published var items:[ItemModel]=[]{
        didSet{
            saveItems()
        }
    }
    let itemsKey : String = "items_key"
    init(){
        getItems()
    }
    
    func getItems(){
    let newItems = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "Second Title", isCompleted: true),
        ItemModel(title: "Third", isCompleted: false)
    ]
        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveAnItem(from: IndexSet, to: Int ){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addAnItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
