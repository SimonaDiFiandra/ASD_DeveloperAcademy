//
//  ContentView.swift
//  BubbleSort
//
//  Created by Simona Di Fiandra on 28/03/23.
//

import SwiftUI

@available(iOS 16.1, *)
struct ContentView: View {
    
    @ObservedObject var model: ContentViewViewModel = ContentViewViewModel()

    @State private var infoModal = false
    @State private var clearAlert = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    let button = Rectangle()
                        .frame(width: 200, height: 70)
                        .cornerRadius(100)
                        .foregroundColor(.blue)
                        .shadow(radius: 2)
                    
                    NavigationLink {
                        InsertIntoArrayView(model: model)
                    } label: {
                        ZStack{
                            button
                            Text("Insert Numbers")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                    
                    NavigationLink {
                        BubbleSortView(model: model)
                    } label: {
                        ZStack{
                            button
                            Text("Magic Bubble Sort")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button {
                        infoModal.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.system(size: 24))
                    }
                    .padding(.top)
                }
                
                VStack{
                    Text("Magic Bubble Sort")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    Spacer()
                    
                    Button {
                        model.clearArray()
                        clearAlert.toggle()
                    } label: {
                        Text("Clear array")
                    }
                    .alert("Array Cleared", isPresented: $clearAlert) {}
                }
            }
            .sheet(isPresented: $infoModal) {
                InfoModalView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.1, *) {
            ContentView()
        } else {
            // Fallback on earlier versions
        }
    }
}
