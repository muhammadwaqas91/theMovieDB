//
//  PopularTVShowsRequest.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation
import RestAPIFramework

struct PopularTVShowsRequest: RequestConvertible {
	let baseURL: String
	let accessToken: String
	let page: Int
	
	var allHTTPHeaderFields: [String : String]? {
		[
			"accept": "application/json",
			"Authorization": "Bearer \(accessToken)"
		]
	}
	var path: String {
		"/3/tv/popular"
	}
	
	var queryItems: [URLQueryItem]? {[
		URLQueryItem(name: "page", value: "\(page)")
	]}
}
