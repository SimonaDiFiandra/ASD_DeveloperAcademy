//
//  ContentViewViewModel.swift
//  MagicBubbleSort
//
//  Created by Simona Di Fiandra on 30/03/23.
//

import Foundation

class ContentViewViewModel : ObservableObject {
    private var persistency = UserDefaults.standard
    var theArray : [Int] = []
    @Published var refresh = false
    
    var bubbles : [bubble] = []
    
    var currentStep = 0
    var isSorted = false
    var sentinel = 0
    var lenght : Int
    
    init() {
        if let data = persistency.object(forKey: "array"){
            theArray = data as! [Int]
            for i in theArray {
                bubbles.append(bubble(value: i))
            }
        }
        lenght = theArray.count-2
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
        
        //this is needed to create the animation of which element are being swapped
        for i in 0...theArray.count-1{
            if i == currentStep {
                bubbles[i].beingLooked = true
                bubbles[i+1].beingLooked = true
            }
            else{
                if i != currentStep+1{
                    bubbles[i].beingLooked = false
                }
            }
        }
        
        if theArray[currentStep] > theArray[currentStep+1]{
            theArray.swapAt(currentStep, currentStep+1)
            bubbles.swapAt(currentStep, currentStep+1)
            sentinel += 1 //each time this if block is accessed sentinel increases to keep track of numbers of swap done in an execution of the algorithm
            if currentStep == lenght{
                currentStep = 0
                sentinel = 0
                if lenght != 0{
                    lenght -= 1 //lenght decreases to avoid unnecessary confronts, these confronts are unnecessary because at the end of each execution of the algorithm, as long is not sorted yet, the biggest element of the array will be on the last position of the array, so we can avoid to confront the array in his entire dimension
                }
            }
            else{
                currentStep += 1
            }
        }
        else{
            if currentStep == lenght{
                if sentinel == 0{
                    isSorted = true //if at the end of the n-th iteration of the algorithm on the array, no swaps have been done (sentinel never been increased), it means that the array is sorted
                    for i in 0...theArray.count-1{
                        bubbles[i].beingLooked = false
                    }
                }
                else{
                    currentStep = 0
                    sentinel = 0
                    if lenght != 0{
                        lenght -= 1
                    }
                }
            }
            else{
                currentStep += 1
            }
        }
        refresh.toggle()
    }
    
}

struct bubble : Hashable {
    var value : Int
    var beingLooked = false
}

