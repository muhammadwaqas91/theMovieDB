//
//  TVSeason.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation

// MARK: - TVSeason
public struct TVSeason: Codable {
	public let id: String?
	public let airDate: String?
	public let episodes: [TVEpisode]?
	public let name, overview: String?
	public let welcomeID: Int?
	public let posterPath: String?
	public let seasonNumber, voteAverage: Int?

	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case airDate = "air_date"
		case episodes, name, overview
		case welcomeID = "id"
		case posterPath = "poster_path"
		case seasonNumber = "season_number"
		case voteAverage = "vote_average"
	}
}
