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
            Circle()
                .frame(width: 35)
                .foregroundColor(color)
            Text("\(value)")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
        
    }
}

struct ElementOfArrayView_Previews: PreviewProvider {
    static var previews: some View {
        ElementOfArrayView(value: 10, color: .cyan)
    }
}
