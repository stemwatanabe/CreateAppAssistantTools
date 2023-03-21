//
//  PrintOnDisplayApp.swift
//  PrintOnDisplay
//
//  Created by 渡辺幹 on 2023/03/21.
//

import SwiftUI

@main
struct PrintOnDisplayApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                PrintOnDisplayView()
            }
        }
    }
}
