//
//  ContentView.swift
//  TaskTracer
//
//  Created by Сергей Дарьин on 25.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var Tasks =  ["Exam", "Learn SwiftUI" ,"Prepare to write an essay"]

    
    var body: some View {
        NavigationView {
            List{
                ForEach (Tasks, id: \.self) { task in
                    Text("\(task)")
                }.onDelete(perform: delete)
                    .onMove(perform: move)
            }
            .navigationBarItems(trailing: EditButton())
        }.refreshable {
            insert(element: "")
        }
    }
    
    func delete(at offsets: IndexSet) {
        Tasks.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        Tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func insert(element : String) {
        Tasks.append(element)
    }
}

#Preview {
    ContentView()
}
