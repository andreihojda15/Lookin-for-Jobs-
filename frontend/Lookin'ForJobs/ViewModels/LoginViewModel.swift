//
//  LoginViewModel.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 13.01.2023.
//

import Foundation

final class LoginViewModel {
    
    @Published var person = StudentModel()
    
    var loginDisabled: Bool {
        person.email.isEmpty || person.password.isEmpty
    }

    
}
