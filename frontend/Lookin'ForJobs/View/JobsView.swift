//
//  JobsView.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 16.01.2023.
//

import SwiftUI

struct JobsView: View {
    @State var job: [JobModel] = []
    var body: some View {
        Text("Jobs")
            .font(.largeTitle)
            .fontWeight(Font.Weight.bold)
            .foregroundColor(Color.mint)
            .padding(.trailing, 250)
        ScrollView {
            
            VStack {
                
                
                ForEach(self.job) { job in
                    HStack {
                        
                        Image("logo")
                            .resizable()
                            .clipShape(Capsule())
                            .frame(width: 80, height: 80)
                            .padding(.leading, -35)
                            .padding(.bottom, 80)
                        VStack(alignment: .leading) {
                            
                            Text(job.name)
                                .font(.title.bold())
                                .padding(.top, -60)
                            
                            Text(job.requiredSkill)
                                .padding(.top, -40)
                                .font(.footnote.italic())
                            
                            Text(job.description)
                                .lineLimit(1)
                            
                            
                        }
                        .frame(width: 200, height: 100, alignment: .leading)
                        
                    }
                    .frame(width: 350, height: 200)
                    .background(Color.mint)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    
                    
                } } }.onAppear(perform: {
                    //  Create the URL to fetch
                    guard let url = URL(string: "http://localhost:8081/api/jobs") else { fatalError("Invalid URL") }
                    
                    // Create the network manager
                    NetworkManager
                        .shared
                    
                    // Request data from the backend
                        .request(fromURL: url) { (result: Result<[JobModel], Error>) in
                            switch result {
                            case .success(let users):
                                job = users
                                debugPrint("We got a successful result with \(job.count) users.")
                            case .failure(let error):
                                debugPrint("We got a failure trying to get the users. The error we got was: \(error.localizedDescription)")
                            }
                        }
                    
                })
        
    }
}


