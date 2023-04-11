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
    
    
    /// Send Rick and Morty Api Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - type: Type of object we expect ot get back
    ///   - completion: Callback with data or Error
    public func execute<T:Codable>(_ request:RMRequest,expecting type:T.Type,completion:@escaping (Result<T,Error>)->Void){
        
    }
}
