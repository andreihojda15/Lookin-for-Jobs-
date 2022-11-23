//
//  Lookin_ForJobsApp.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 23.11.2022.
//

import SwiftUI

@main
struct Lookin_ForJobsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
