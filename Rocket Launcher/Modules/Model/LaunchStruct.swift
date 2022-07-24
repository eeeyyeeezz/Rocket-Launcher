//
//  LaunchStruct.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 23.07.2022.
//

import Foundation

// MARK: - LaunchStructElement

struct LaunchStruct: Decodable {
    let rocket: Rocket
    let success: Bool?
    let name: String
    let date_utc: String?
    let id: String
}

enum Rocket: String, Codable {
    case falconOne = "5e9d0d95eda69955f709d1eb"
    case falconNine = "5e9d0d95eda69973a809d1ec"
    case falconHeavy = "5e9d0d95eda69974db09d1ed"
}
