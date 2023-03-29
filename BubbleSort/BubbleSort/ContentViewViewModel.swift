//
//  ContentViewViewModel.swift
//  BubbleSort
//
//  Created by Simona Di Fiandra on 29/03/23.
//

import Foundation

class ContentViewViewModel : ObservableObject {
    private var persistency = UserDefaults.standard
    var theArray : [Int] = []
    @Published var refresh = false
    var currentStep = 0
    var swap = true
    
    init() {
        if let data = persistency.object(forKey: "array"){
            theArray = data as! [Int]
        }
    }
    
    func saveArray(data: [Int]){
        persistency.set(data, forKey: "array")
    }
    
    func insertIntoArray(value: Int){
        theArray.append(value)
    }
    
    func clearArray(){
        theArray = []
        saveArray(data: theArray)
    }
    
    func bubbleSortStep(){
        if theArray[currentStep] > theArray[currentStep+1]{
            theArray.swapAt(currentStep, currentStep+1)
            refresh.toggle()
            print(theArray)
            currentStep += 1
            if(currentStep == theArray.count-1){
                currentStep = 0
                swap = true
            }
        }
        
    }
    
}
