//
//  URL+Extension.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

import Foundation
extension URL {
	var isValid: Bool {
		guard let scheme = scheme,
			  ["http", "https"].contains(scheme.lowercased()) else {
			return false
		}
		return true
	}
}
