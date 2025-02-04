//
//  JSONFileLoader.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation
import RestAPIFramework

enum JSONFileType: String {
	case popular
	case show
	case season
	case episode
	case configuration
}

struct JSONFileLoader {
	public static func loadJSON<T: Decodable>(_ decodableType: T.Type, from filename: JSONFileType) throws -> T? {
		guard let url = Bundle.main.url(forResource: filename.rawValue, withExtension: "json") else {
			print("❌ File not found: \(filename).json")
			return nil
		}
		
		do {
			let data = try Data(contentsOf: url)
			return try DataParser().parse(T.self, data: data)
		} catch {
			print("❌ Error decoding JSON: \(error)")
			return nil
		}
	}
}
