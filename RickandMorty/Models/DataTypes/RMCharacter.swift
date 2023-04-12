//
//  RMCharacter.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 10/04/23.
//

import Foundation

struct RMCharacters:Codable{
    let id: Int
    let name:String
    let status: RMCharactersStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin:RMOrigin
    let location:RMSingleLocation
    let image:String
    let episode: [String]
    let url:String
    let created: String
}

