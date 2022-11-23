//
//  FrontApp.swift
//  Front
//
//  Created by Alexandra Minyov on 23.11.2022.
//

import SwiftUI

@main
struct FrontApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
