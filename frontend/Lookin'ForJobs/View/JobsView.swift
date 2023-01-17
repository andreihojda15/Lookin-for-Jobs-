//
//  JobsView.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 16.01.2023.
//

import SwiftUI

struct JobsView: View {
    @State var job: [JobModel] = []
    @State private var searchText = ""
    @State private var showingSheet = false
    var body: some View {
        HStack {
            Text("Jobs")
                .font(.largeTitle)
                .fontWeight(Font.Weight.bold)
                .foregroundColor(Color.mint)
                .padding(.trailing, 230)
            Button("....") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                        LoginView()
                    }
            .padding()
            .frame(width: 50, height: 50)
            .background(Image("b 1").padding(.leading, 20).padding(.top, 120))
            .foregroundColor(Color.black)
            .font(.custom("Arial", size: 15).bold())
            .clipShape(Capsule())
        }
        TextField("  Search...",text: $searchText)
            .searchable(text: $searchText)
            .frame(width: 350, height: 30)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            .padding(.bottom, 7)
        
        ScrollView {
            VStack {
                ForEach(self.job) { job in
                    HStack {
                        
                        Image("conti")
                            .resizable()
                            .clipShape(Capsule())
                            .frame(width: 80, height: 80)
                            .padding(.leading, -1)
                            .padding(.bottom, 80)
                        VStack(alignment: .leading) {
                          
                            Text(job.name)
                                .font(.title.bold())
                                .padding(.top, -60)
                                .padding(.leading, 10)
                            Divider().frame(width: 250, height: 1).padding(.top, -48)
                            
                            Text(job.requiredSkill)
                                .padding(.top, -40)
                                .padding(.leading, 10)
                                .font(.footnote.italic())
                            
                            Text(job.description)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .padding(.bottom, -20)
                                .padding(.leading, 10)

                            
                           
                        }
                        .frame(width: 200, height: 100, alignment: .leading)
                        Button("Apply") {
                            if let url = URL(string: "https://www.continental.com/en/") {
                                   if #available(iOS 10, *){
                                       UIApplication.shared.open(url)
                                   }else{
                                       UIApplication.shared.openURL(url)
                                   }

                               }
                        }
                        .padding()
                        .frame(width: 100)
                        .background(Image("b 1").padding(.leading, 20).padding(.top, 120).opacity(0.4))
                        .foregroundColor(Color.black)
                        .font(.custom("Arial", size: 15).bold())
                        .clipShape(Capsule())
                        .padding(.leading, -70)
                        .padding(.bottom, -150)
                        .padding(.top, 90)
                    }
                    .frame(width: 350, height: 200)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    
                }
               
            }
            .shadow(color: Color.mint,radius: 200)
        }.onAppear(perform: {
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


