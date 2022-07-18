//
//  StartViewModel.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import Foundation

struct JSONParser {

  static func parsData(completionHandler: @escaping (([StructElement]) -> Void)) {
		if let url = URL(string: "https://api.spacexdata.com/v4/rockets") {
			URLSession.shared.dataTask(with: url) { data, response, error in
				if let data = data {
					do {
						let result = try JSONDecoder().decode([StructElement].self, from: data)
						completionHandler(result)
					} catch let error {
						debugPrint(error)
         }
       }
     }.resume()
    }
  }

}
