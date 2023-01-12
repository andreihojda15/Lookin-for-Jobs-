//
//  Credentials.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 13.01.2023.
//

import Foundation

class Credentials: Codable, Identifiable, ObservableObject {
    var email = StudentModel().email
    var password = StudentModel().password
}
