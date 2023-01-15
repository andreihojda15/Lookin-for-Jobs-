//
//  CreateNewAccountVM.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 07.01.2023.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var person = StudentModel()
    
    func create(person: StudentModel) {
        NetworkManager
            .shared
            .postRequest(fromURL: URL(string: "http://localhost:8081/api/user")!, task: person) {  (result: Result<StudentModel, Error>) in
                switch result {
                case .success:
                    
                    debugPrint("Success")
                case .failure(let error):
                    debugPrint("We got a failure trying to post. The error we got was: \(error.localizedDescription)")}
            }
    }
}
