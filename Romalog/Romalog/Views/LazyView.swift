//
//  LazyView.swift
//  Romalog
//
//  Created by Rohit Paul on 4/23/24.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
    }
}
