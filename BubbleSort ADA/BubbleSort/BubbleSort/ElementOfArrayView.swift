//
//  ElementOfArrayView.swift
//  BubbleSort
//
//  Created by Simona Di Fiandra on 29/03/23.
//

import SwiftUI

struct ElementOfArrayView: View {
    var value: Int
    var color: Color
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 30, height: 30)
                .cornerRadius(10)
                .foregroundColor(color)
            Text("\(value)")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(size: 17))
        }
        
    }
}

struct ElementOfArrayView_Previews: PreviewProvider {
    static var previews: some View {
        ElementOfArrayView(value: 10, color: .blue)
    }
}
