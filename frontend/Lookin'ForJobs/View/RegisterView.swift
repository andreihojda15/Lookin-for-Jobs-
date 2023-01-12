//
//  RegisterView.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 29.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State var student = StudentModel()
    @StateObject private var vm = RegisterViewModel()
    
    
    var body: some View {
        VStack() {
            Spacer(minLength: .zero)
                              Image("logo")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(300)
                        .shadow(radius: 5)
                        .padding(.top, -20)
                        .padding(.bottom, 30)
            
           // Spacer(minLength: .zero)
            Text("SignUp")
                .font(.largeTitle)
                .fontWeight(Font.Weight.bold)
                .foregroundColor(Color.mint)
               // .padding(.leading, -150)
                    VStack(alignment: .center) {
                        
                        TextField("First Name", text: $student.firstName)
                            .cornerRadius(5.0)
                            .padding(.horizontal, 50)
                        
                        lineSeparator
                        
                        TextField("Last Name", text: $student.lastName)
                            .cornerRadius(5.0)
                            .padding(.horizontal, 50)
                        lineSeparator
                        
                        TextField("E-mail", text: $student.email)
                            .cornerRadius(5.0)
                            .padding(.horizontal, 50)
                        lineSeparator
                        SecureField("Password",text: $student.password)
                            .cornerRadius(5.0)
                            .padding(.horizontal, 50)
                        lineSeparator
                        TextField("Phone Number",text: $student.contactNumber)
                            .cornerRadius(5.0)
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 50)
                        lineSeparator
                        
                        
                    }
                    Button("register") {
                        vm.create(person: student)
                    }
                    .padding()
                    .background(Color.mint)
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
                    .padding(.top, 30)
                    
            Spacer(minLength: .zero)
                }
        .padding(.bottom, 50)
            
        
       
    }
    @ViewBuilder
    private var lineSeparator: some View {
        Divider()
            .frame(height: 1)

            .background(
                            LinearGradient(
                                colors: [ .mint, .clear, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            )
            
            .padding(.horizontal, 30)
            .padding(.bottom, 15)
                       
    }
}
