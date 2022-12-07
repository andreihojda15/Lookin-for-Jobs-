//
//  User.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 24.11.2022.
//

import Foundation

struct User: Decodable {
    
    let id: CLong
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let contactNumber: String
    
}

extension URLSession {
  func fetchData(at url: URL, completion: @escaping (Result<[User], Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let user = try JSONDecoder().decode([User].self, from: data)
          completion(.success(user))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}
