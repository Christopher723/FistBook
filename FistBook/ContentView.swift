//
//  ContentView.swift
//  FistBook
//
//  Created by Christopher Woods on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var currentPageIndex = 0
    let book: Book
    
    var body: some View {
        VStack{
            PageView(page: book.pages[currentPageIndex], pageNumber: book.pages[currentPageIndex].pageNumber)
            {
                if currentPageIndex < book.pages.count - 1{
                    currentPageIndex += 1
                }
                else{
                    currentPageIndex = 0
                }
                
            }
        }
    }
    
}

#Preview {
    ContentView(book: myBook)
}
