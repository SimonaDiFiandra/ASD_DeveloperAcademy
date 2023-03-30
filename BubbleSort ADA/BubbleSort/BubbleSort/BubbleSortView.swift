//
//  BubbleSortView.swift
//  BubbleSort
//
//  Created by Simona Di Fiandra on 28/03/23.
//

import SwiftUI

struct BubbleSortView: View {
    var model : ContentViewViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack{
            
            ZStack {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(model.bubbles, id: \.self) { i in
                            ElementOfArrayView(value: i.value, color: i.beingLooked ? .red : .blue)
                        }
                        .offset(x: 10)
                    }
                }
                .background(Color.clear.disabled(model.refresh))
                .onReceive(timer) { input in
                    if !model.isSorted && !model.theArray.isEmpty{
                        model.bubbleSortStep()
                    }
                }
                .padding(.top)
                .offset(x: 10)
                
                VStack{
                    Text("Magic Bubble Sort\nGraphic Rapresentation")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    Spacer()
                    if model.theArray.count > 10{
                        Text("You can scroll horizontally to see the rest of the array!")
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            
        }
        .onAppear(){
            model.lenght = model.theArray.count-2
            model.currentStep = 0
            model.sentinel = 0
            model.isSorted = false
            
            model.bubbles = []
            for i in model.theArray {
                model.bubbles.append(bubble(value: i))
            }
            
        }
    }
}
/*
struct BubbleSortView_Previews: PreviewProvider {
    static var previews: some View {
        let c = ContentViewViewModel()
        c.theArray = [4,3,2,1]
        return BubbleSortView(model: c)
    }
}*/
