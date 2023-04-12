//
//  RMRequest.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 10/04/23.
//

import Foundation


/// Object that Represent Singlet api call
final class RMRequest{
    
    /// API Constant
    private struct Constants{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired Endpoints
    let endPoint:RMEndPoint
    
    
    /// Path componets for Api if Any
    let pathComponets:[String]
    
    
    /// Query Arguments for Api if Any
    let queryParameters:[URLQueryItem]
    
    public let httpMethods = "GET"
    
    /// Constructed url for the api request in string format
    private var urlString:String{
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponets.isEmpty{
            pathComponets.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    
    /// Computed and Constructed Api Url
    public var url:URL?{
        return URL(string: urlString)
    }
    
    
    //MARK: - Public
    
    /// Construct Request
    /// - Parameters:
    ///   - endPoint: Target Endpoint
    ///   - pathComponets:  Collection of Path Componets
    ///   - queryParameters: Collection of Query Params
     public init(endPoint: RMEndPoint, pathComponets: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponets = pathComponets
        self.queryParameters = queryParameters
    }
}

extension RMRequest{
    static let listCharacterRequest = RMRequest(endPoint: .character)
}
