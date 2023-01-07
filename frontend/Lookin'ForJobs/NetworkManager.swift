//
//  NetworkManager.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 29.12.2022.
//

import Foundation

struct RegisterModel: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}

    /// These are the errors this class might return
    enum ManagerErrors: Error {
        case invalidResponse
        case invalidStatusCode(Int)
    }

    func request<T: Decodable>(fromURL url: URL, httpMethod: HttpMethod = .get, completion: @escaping (Result<T, Error>) -> Void) {
        let completionOnMain: (Result<T, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }

        // Create the request.
     let request = buildRequest(from: url, httpMethod: httpMethod)

        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
           
            if let error = error {
                completionOnMain(.failure(error))
                return
            }

            guard let urlResponse = response as? HTTPURLResponse else { return completionOnMain(.failure(ManagerErrors.invalidResponse)) }
            if !(200..<300).contains(urlResponse.statusCode) {
                return completionOnMain(.failure(ManagerErrors.invalidStatusCode(urlResponse.statusCode)))
            }

            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode(T.self, from: data)
                completionOnMain(.success(users))
            } catch {
                debugPrint("Could not translate the data to the requested type. Reason: \(error.localizedDescription)")
                completionOnMain(.failure(error))
            }
        }

        // Start the request
        urlSession.resume()
    }

    func postRequest(task: StudentModel, completion: @escaping (Result<StudentModel, Error>) -> Void) {
        let url = URL(string: "http://localhost:8081/api/user")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let taskData = try! JSONEncoder().encode(task)
        request.httpBody = taskData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if let data = data {
                    print(String(data: data, encoding: .utf8)!)
                }
            }
            guard let data = data else {
                completion(.failure(NSError()))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let user = try decoder.decode(StudentModel.self, from: data)
                print(user)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
//    func request(fromURL url: URL, httpMethod: HttpMethod = .get, completion: @escaping (Result<Void, Error>) -> Void) {
//        let completionOnMain: (Result<Void, Error>) -> Void = { result in
//            DispatchQueue.main.async {
//                completion(result)
//            }
//        }
//
//        // Create the request.
//        let request = buildRequest(from: url, httpMethod: httpMethod)
//
//        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if let error = error {
//                completionOnMain(.failure(error))
//                return
//            }
//
//            guard let urlResponse = response as? HTTPURLResponse else { return completionOnMain(.failure(ManagerErrors.invalidResponse)) }
//            if !(200..<300).contains(urlResponse.statusCode) {
//                return completionOnMain(.failure(ManagerErrors.invalidStatusCode(urlResponse.statusCode)))
//            }
//
//        }
//
//        // Start the request
//        urlSession.resume()
//    }
    
}
extension NetworkManager {
    /// The request method
    enum HttpMethod{
        case get
        case post
        }
    }


private extension NetworkManager {
    func buildRequest(from url: URL,
                      httpMethod: HttpMethod) -> URLRequest {
        var request = URLRequest(url: url)
        
        switch httpMethod {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        }
        return request
    }
}
