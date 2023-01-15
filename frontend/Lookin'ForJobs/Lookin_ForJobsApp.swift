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
    @StateObject var authentication = Authentication()

    var body: some Scene {
        WindowGroup {
          
            if authentication.isValidated {
                ContentView()
                    .environmentObject(authentication)
            } else {
                    LoginView()
                        .environmentObject(authentication)

            }
        }
    }
}
