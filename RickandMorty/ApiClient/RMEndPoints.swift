//
//  RMEndPoints.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 10/04/23.
//

import Foundation

/// Represent Unique Api Endpoints
@frozen enum RMEndPoint:String{
    /// EndPoint to get Character info
    case character
    /// EndPoint to get Location info
    case location
    /// EndPoint to get Episode info
    case episode
}
