//
//  RMService.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 10/04/23.
//

import Foundation


/// Primary API Service object to get Rick and Morty Data
final class RMService{
    /// Shared Singleton Instanc e
    static let shared = RMService()
    /// Privatize Constructor
    private init(){}
    
    enum RMServiceError:Error{
        case failedToCreateRequest
        case failedToGetResponse
    }
    
    /// Send Rick and Morty Api Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - type: Type of object we expect ot get back
    ///   - completion: Callback with data or Error
    public func execute<T:Codable>(_ request:RMRequest,expecting type:T.Type,completion:@escaping (Result<T,Error>)->Void){
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data , error == nil else {
                completion(.failure(RMServiceError.failedToGetResponse))
                return
            }
            
            do{
                let jsonData = try JSONDecoder().decode(type.self, from: data)
                completion(.success(jsonData))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    
    //MARK: - Private
    
    private func request(from rmRequest:RMRequest) -> URLRequest?{
        guard let url = rmRequest.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethods
        return request
    }
    
    
}

