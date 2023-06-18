//
//  DevoteApp.swift
//  Devote
//
//  Created by kirshi on 6/11/23.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared

    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }
}
