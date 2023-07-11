//
//  NetworkManager.swift
//  NBA-Application
//
//  Created by Berk on 28.06.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    @discardableResult
    func fetch<T: Codable>(type: T.Type, url: URL, completion: @escaping (Result<T, ErrorTypes>) -> ()) -> URLSessionDataTask {
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.generalError))
                return
            }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                completion(.failure(.invalidUrl))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            self.handleSuccessfulResponse(data: data) { response in
                completion(response)
            }
        }
        
        dataTask.resume()
        
        return dataTask
    }
    
    private func handleSuccessfulResponse<T: Codable>(data: Data, completion: @escaping (Result<T, ErrorTypes>) -> ()) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
}
