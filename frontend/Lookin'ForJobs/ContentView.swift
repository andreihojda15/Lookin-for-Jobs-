//
//  ContentView.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 23.11.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var student: [StudentModel] = []
    
    
    var body: some View {
        VStack{
            
        }
      // RegisterView()
        //            VStack{
        //                NavigationLink(destination: Login()){
        //                    Text("login")
        //                }
        
        
        //            VStack{
        //                List(self.student) { (student) in
        //                    Text(student.firstName)
        //
        //                }}.onAppear(perform: {
        // Create the URL to fetch
        //                    guard let url = URL(string: "http://localhost:8081/api/user") else { fatalError("Invalid URL") }
        //
        //                    // Create the network manager
        //                   NetworkManager
        //                        .shared
        //
        //                    // Request data from the backend
        //                    .request(fromURL: url) { (result: Result<[StudentModel], Error>) in
        //                        switch result {
        //                        case .success(let users):
        //                            student = users
        //                            debugPrint("We got a successful result with \(student.count) users.")
        //                        case .failure(let error):
        //                            debugPrint("We got a failure trying to get the users. The error we got was: \(error.localizedDescription)")
        //                        }
        //                    }
        //                })
        //
        //    }
        
    }
}
