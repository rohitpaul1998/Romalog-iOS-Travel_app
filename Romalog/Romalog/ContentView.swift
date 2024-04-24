//
//  ContentView.swift
//  Romalog
//
//  Created by Rohit Paul on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .preferredColorScheme(.dark)
//        LazyViewExample()
    }
}

#Preview {
    ContentView()
}

//struct LazyViewExample: View {
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(0...10, id: \.self) { i in
//                    NavigationLink {
//                        LazyView {
//                            ItemCellView(itemName: "View \(i)")
//                        }
//                    } label: {
//                        Text("View \(i)")
//                    }
//                }
//            }
//            .navigationTitle("romalog.com")
//        }
//    }
//}

//struct ItemCellView: View {
//    var itemName: String
//    init(itemName: String) {
//        self.itemName = itemName
//        print("\(itemName) initialized")
//    }
//    var body: some View {
//        Text(itemName)
//    }
//}

