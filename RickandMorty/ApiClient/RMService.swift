//
//  RMService.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 10/04/23.
//

import Foundation


/// Primary API Service object to get Rick and Morty Data
final class RMService{
    /// Shared Singleton Instance
    static let shared = RMService()
    /// Privatize Constructor
    private init(){}
    
    
    /// Send Rick and Morty Api Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - completion: Callback with data or Error
    public func execute(_ request:RMRequest,completion:@escaping ()->Void){
        
    }
}
