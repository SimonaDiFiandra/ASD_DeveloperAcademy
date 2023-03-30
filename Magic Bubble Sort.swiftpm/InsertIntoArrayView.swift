//
//  InsertIntoArray.swift
//  BubbleSort
//
//  Created by Simona Di Fiandra on 29/03/23.
//

import SwiftUI

@available(iOS 16.1, *)
struct InsertIntoArrayView: View {
    var model : ContentViewViewModel?
    
    @State var textContent = "";
    @State var alertSuccess = false
    @State var alertFail = false
    
    var body: some View {
        VStack{
            
            CaptionView()
            
            TextField("Example: 1, 2, 3...", text: $textContent)
                .padding(.horizontal, 50.0)
            
            Button {
                do{
                    try insertIntoArray(numbersString: textContent)
                    alertSuccess.toggle()
                    textContent = ""
                }
                catch InsertionError.invalidNumbers{
                    alertFail.toggle()
                    textContent = ""
                }
                catch{
                    print("something wrong")
                }
            } label: {
                ConfirmButtonView()
            }
            .alert("Insertion succeeded!\nAnother insertion?", isPresented: $alertSuccess) {
                Button("OK", role: .cancel){
                    //TODO: Navigate back to first view oppure potrebbe proporre se voler inserire altro e quindi rimanere nella stessa view oppure tornare indietro
                }
            }
            .alert("Invalid characters has been inserted, try again.", isPresented: $alertFail){
                Button("OK", role: .cancel){}
            }
        }
        .textFieldStyle(.roundedBorder)
    }
    
    
}

@available(iOS 16.1, *)
struct InsertIntoArrayView_Previews: PreviewProvider {
    static var previews: some View {
        InsertIntoArrayView()
    }
}

private struct CaptionView: View {
    var body: some View{
            Text("Insert here one or more numbers separated by commas:")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50.0)
                .offset(y: -20)
    }
}

private struct ConfirmButtonView: View{
    var body: some View{
            ZStack {
                Rectangle()
                    .frame(width: 120, height: 50)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                Text("Confirm")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            .padding(.top, 20.0)
    }
}
