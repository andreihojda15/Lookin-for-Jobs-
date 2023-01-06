//
//  StudentModel.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 29.12.2022.
//

import Foundation

class StudentModel: Codable, Identifiable, ObservableObject{
    var id: Int = 0
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    var contactNumber: String = ""
   // var dateOfBirth: String
}
