//
//  JobModel.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 16.01.2023.
//

import Foundation

class JobModel: Codable, Identifiable, ObservableObject {
    var id: Int = 0
    var companyId: Int = 0
    var name: String = ""
    var experience: Int = 0
    var requiredSkill: String = ""
    var description: String = ""
}
