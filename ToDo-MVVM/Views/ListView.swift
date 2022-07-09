//
//  ListView.swift
//  ToDo-MVVM
//
//  Created by Samuel Ofori on 1/14/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel

    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List {
                    ForEach(listViewModel.items){ item in
                        ListRowView(item:item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform:listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveAnItem)
                    
                }
                .listStyle(PlainListStyle())
            }
        }
       
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: AddView())
        )
    }
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}


