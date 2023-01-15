//
//  LoginView.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 13.01.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var loginVM = LoginViewModel()
   // @Published var credentials = Credentials()
    @EnvironmentObject var authentication: Authentication
  
    var body: some View {
        VStack {
           // Spacer(minLength: .zero)
                              Image("logo")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(300)
                        .shadow(radius: 5)
                        .padding(.top, -20)
                        .padding(.bottom, 30)
            
           // Spacer(minLength: .zero)
            Text("Login")
                .font(.largeTitle)
                .fontWeight(Font.Weight.bold)
                .foregroundColor(Color.mint)
            TextField("Email", text: $loginVM.credentials.email)
                .textInputAutocapitalization(.none)
                .cornerRadius(5.0)
                .padding(.horizontal, 50)
            SeparatorView()
            SecureField("Password", text: $loginVM.credentials.password)
                .textInputAutocapitalization(.none)
                .cornerRadius(5.0)
                .padding(.horizontal, 50)
            SeparatorView()
           
            if loginVM.showProgressView {
                ProgressView()
            }
            Button("Login") {
                NetworkManager
                            .shared
                            .postRequest(fromURL: URL(string: "http://localhost:8081/api/user/login")!, task: loginVM.credentials) { (result: Result<Credentials, Error>) in
                                switch result {
                                case .success:
                                    DispatchQueue.main.async {
                                       authentication.updateValidation(success: true)
                                    }
                                case .failure:
                                   authentication.updateValidation(success: false)

                                    print("error")
                                }
                            }
                
            }//.disabled(loginVM.loginDisabled)
            .padding()
            .background(Color.mint)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .padding(.top, 30)
            Text("Don't you have an account?")
            NavigationLink("Click me!", destination: RegisterView())
        }
        
    }
}
