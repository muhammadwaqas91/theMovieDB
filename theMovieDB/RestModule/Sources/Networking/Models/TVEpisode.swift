//
//  TVEpisode.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation

// MARK: - TVEpisode
public struct TVEpisode: Codable {
	public let airDate: String?
	public let episodeNumber: Int?
	public let name, overview: String?
	public let id: Int?
	public let productionCode: String?
	public let runtime, seasonNumber: Int?
	public let stillPath: String?
	public let voteAverage: Double?
	public let voteCount: Int?

	enum CodingKeys: String, CodingKey {
		case airDate = "air_date"
		case episodeNumber = "episode_number"
		case name, overview, id
		case productionCode = "production_code"
		case runtime
		case seasonNumber = "season_number"
		case stillPath = "still_path"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}
}
