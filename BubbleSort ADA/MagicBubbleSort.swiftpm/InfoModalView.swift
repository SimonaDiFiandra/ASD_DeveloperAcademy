//
//  InfoModalView.swift
//  MagicBubbleSort
//
//  Created by Simona Di Fiandra on 30/03/23.
//

import SwiftUI

struct InfoModalView: View {
    var body: some View {
        VStack
        {
            Text("What is BubbleSort")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Text("What is BubbleSort")
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.bottom)
        }
    }
}

struct InfoModalView_Previews: PreviewProvider {
    static var previews: some View {
        InfoModalView()
    }
}

