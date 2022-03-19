//
//  ExamplesSwiftKOREiOSApp.swift
//  ExamplesSwiftKOREiOS
//
//  Created by Leif Ashley on 3/19/22.
//

import SwiftUI
import SwiftKORE

@main
struct ExamplesSwiftKOREiOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
                startupDetails()
            }
        }
    }
    
    func startupDetails() {
        loggingDetails()
        colorDetails()
    }
    
    func loggingDetails() {
        log.debug("testme")
    }
    
    func colorDetails() {
        let c = UIColor(hexString: "FFAAEE77")
        print("CHEX: \(c.hexWithAlpha)")
        
        print("SYSBlue: \(Color.systemBlue.hex)")
    }
}
