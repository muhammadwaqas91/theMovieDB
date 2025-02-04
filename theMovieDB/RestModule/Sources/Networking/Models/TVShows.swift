//
//  TVShows.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//
import Foundation

// MARK: - TVShows
public struct TVShows: Codable {
	public let page: Int
	public let results: [TVShow]
	public let totalPages, totalResults: Int

	enum CodingKeys: String, CodingKey {
		case page, results
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}
}
