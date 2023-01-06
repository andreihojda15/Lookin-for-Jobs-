//
//  Login.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 29.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var studentModel: StudentModel = StudentModel()
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("First Name", text: $studentModel.firstName)
                        .cornerRadius(5.0)
                    
                    TextField("Last Name", text: $studentModel.lastName)
                        .cornerRadius(5.0)
                    
                    TextField("E-mail", text: $studentModel.email)
                        .cornerRadius(5.0)
                    
                    TextField("Password",text: $studentModel.password)
                        .cornerRadius(5.0)
                }
                    Button("register") {
                        //
                    }
                
            } .background(Color.red)
        }
    }
}

