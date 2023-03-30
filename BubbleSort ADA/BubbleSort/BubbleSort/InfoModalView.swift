//
//  InfoModalView.swift
//  BubbleSort
//
//  Created by Simona Di Fiandra on 29/03/23.
//

import SwiftUI

struct InfoModalView: View {
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack (alignment: .leading, spacing: 10)
            {
                Text("What is BubbleSort")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                Text("Important Characteristics:")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Text("1. Simple Sorting Algorithm: Bubble Sort is one of the simplest sorting algorithms, making it easy to understand and implement.")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("2. Comparison-Based: Bubble Sort compares adjacent elements and swaps them if they are in the wrong order, resulting in the largest (or smallest) element 'bubbling' to the end of the list.")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("3. Time Complexity: Bubble Sort has an average and worst-case time complexity of O(n^2), where n is the number of elements in the list. This makes it inefficient for large datasets.")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("4. Space Complexity: Bubble Sort has a space complexity of O(1), as it sorts the elements in place without using any additional memory.")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("5. Stable Sorting: Bubble Sort is stable, meaning that it maintains the relative order of equal elements in the sorted output.")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("6. Adaptive: Bubble Sort can be adaptive, meaning that its performance can be improved for partially sorted lists by using an optimization like checking if any swaps were made in the last pass.")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct InfoModalView_Previews: PreviewProvider {
    static var previews: some View {
        InfoModalView()
    }
}
