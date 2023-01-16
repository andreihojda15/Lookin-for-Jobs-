//
//  Authentication.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 13.01.2023.
//

import SwiftUI

class Authentication: ObservableObject {
    
    @Published var isValidated = false
    
    func updateValidation(success: Bool) {
        withAnimation{
            isValidated = success
        }
    }
}
