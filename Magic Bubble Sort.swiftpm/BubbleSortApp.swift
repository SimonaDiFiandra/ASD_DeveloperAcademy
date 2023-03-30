//
//  BubbleSortApp.swift
//  BubbleSort
//
//  Created by Simona Di Fiandra on 28/03/23.
//

import SwiftUI

@main
struct BubbleSortApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.1, *) {
                ContentView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
