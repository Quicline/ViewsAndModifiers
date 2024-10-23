//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Armando Francisco on 10/22/24.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row,column)
                            
                    }
                }
            }
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .padding()
//            .background(.blue)
//            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
//        GridStack(rows: 4, columns: 4) { row, col in
//            Image(systemName: "\(row * 4 + col).circle")
//            Text("R\(row) C\(col)")
//                .padding(2)
//                .background(.gray)
//        }
        Text("Custom Title with view modifier")
            .titleStyle()
    }
}

#Preview {
    ContentView()
}
