//
//  Model.swift
//  ToDo-MVVM
//
//  Created by Samuel Ofori on 1/14/22.
//

import Foundation

struct ItemModel: Identifiable{
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
