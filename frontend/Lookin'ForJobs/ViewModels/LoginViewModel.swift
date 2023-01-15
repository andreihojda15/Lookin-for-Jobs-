//
//  LoginViewModel.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 13.01.2023.
//

import Foundation
import SwiftUI

final class LoginViewModel {
   // @Published var loginV = LoginView()
    @Published var person = StudentModel()
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @EnvironmentObject var authentication: Authentication
    @Published var isLog = false
    
    var loginDisabled: Bool {
        person.email.isEmpty || person.password.isEmpty
    }

//    func login(){
//        showProgressView = true
//        NetworkManager
//            .shared
//            .postRequest(fromURL: URL(string: "http://localhost:8081/api/user/login")!, task: credentials) { (result: Result<Credentials, Error>) in
//                switch result {
//                case .success:
//                    print("Success")
//                case .failure:
//                    print("error")
//                }
//            }
//        
//    }
}
