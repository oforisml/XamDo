//
//  ToDo_MVVMApp.swift
//  ToDo-MVVM
//
//  Created by Samuel Ofori on 1/14/22.
//

import SwiftUI
/**
 MVVM Architecture
 Model - data point
 View - UI
 ViewModel - manages Models for view
 **/
@main
struct ToDo_MVVMApp: App {
    @StateObject var listViewModel: ListViewModel =  ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
