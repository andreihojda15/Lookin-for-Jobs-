//
//  Login.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 29.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State var student = StudentModel()
    @StateObject private var vm = RegisterViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("First Name", text: $student.firstName)
                        .cornerRadius(5.0)
                    
                    TextField("Last Name", text: $student.lastName)
                        .cornerRadius(5.0)
                    
                    TextField("E-mail", text: $student.email)
                        .cornerRadius(5.0)
                    
                    TextField("Password",text: $student.password)
                        .cornerRadius(5.0)
                }
                    Button("register") {
                        vm.create(person: student)
                    }
                
            }
        }
        .navigationTitle("Register")
       
    }
}

