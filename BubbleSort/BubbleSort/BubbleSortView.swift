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
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(model.theArray, id: \.self) { i in
                        ElementOfArrayView(value: i)
                    }
                    .offset(x: 10)
                }
            }
            .background(Color.clear.disabled(model.refresh))
            .onReceive(timer) { input in
                print("Timer")
                if !model.swap {
                    model.swap = false
                    model.bubbleSortStep()
                }
                else{
                    
                }
            }
            .padding(.top)
            .offset(x: 10)

        }
    }
}

struct sortButton: View{
    var body: some View{
        ZStack{
            Rectangle()
                .frame(width: 250, height: 40)
                .cornerRadius(10)
                .foregroundColor(.blue)
                .shadow(radius: 2)
            Text("Show the Bubble Sort")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        
    }
}

struct BubbleSortView_Previews: PreviewProvider {
    static var previews: some View {
        let c = ContentViewViewModel()
        c.theArray = [2, 1, 3, 4, 5, 3, 9, 6]
        return BubbleSortView(model: c)
    }
}
