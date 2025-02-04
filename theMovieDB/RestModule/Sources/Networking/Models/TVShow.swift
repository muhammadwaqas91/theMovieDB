//
//  TVShow.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation

// MARK: - TVShow
public struct TVShow: Codable {
	public let adult: Bool?
	public let backdropPath: String?
	public let createdBy: [CreatedBy]?
	public let episodeRunTime: [Int]?
	public let firstAirDate: String?
	public let genres: [Genre]?
	public let homepage: String?
	public let id: Int?
	public let inProduction: Bool?
	public let languages: [String]?
	public let lastAirDate: String?
	public let lastEpisodeToAir: TEpisodeToAir?
	public let name: String?
	public let nextEpisodeToAir: TEpisodeToAir?
	public let numberOfEpisodes, numberOfSeasons: Int?
	public let originCountry: [String]?
	public let originalLanguage, originalName, overview: String?
	public let popularity: Double?
	public let posterPath: String?
	public let productionCompanies: [ProductionCompany]?
	public let productionCountries: [ProductionCountry]?
	public let seasons: [TVSeason]?
	public let spokenLanguages: [SpokenLanguage]?
	public let status, tagline, type: String?
	public let voteAverage: Double?
	public let voteCount: Int?

	enum CodingKeys: String, CodingKey {
		case adult
		case backdropPath = "backdrop_path"
		case createdBy = "created_by"
		case episodeRunTime = "episode_run_time"
		case firstAirDate = "first_air_date"
		case genres, homepage, id
		case inProduction = "in_production"
		case languages
		case lastAirDate = "last_air_date"
		case lastEpisodeToAir = "last_episode_to_air"
		case name
		case nextEpisodeToAir = "next_episode_to_air"
		case numberOfEpisodes = "number_of_episodes"
		case numberOfSeasons = "number_of_seasons"
		case originCountry = "origin_country"
		case originalLanguage = "original_language"
		case originalName = "original_name"
		case overview, popularity
		case posterPath = "poster_path"
		case productionCompanies = "production_companies"
		case productionCountries = "production_countries"
		case seasons
		case spokenLanguages = "spoken_languages"
		case status, tagline, type
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}
}

// MARK: - CreatedBy
public struct CreatedBy: Codable {
	public let id: Int?
	public let creditID, name, originalName: String?
	public let gender: Int?

	enum CodingKeys: String, CodingKey {
		case id
		case creditID = "credit_id"
		case name
		case originalName = "original_name"
		case gender
	}
}

// MARK: - Genre
public struct Genre: Codable {
	public let id: Int?
	public let name: String?
}

// MARK: - TEpisodeToAir
public struct TEpisodeToAir: Codable {
	public let id: Int?
	public let name, overview: String?
	public let voteAverage, voteCount: Int?
	public let airDate: String?
	public let episodeNumber: Int?
	public let episodeType, productionCode: String?
	public let runtime, seasonNumber, showID: Int?
	public let stillPath: String?

	enum CodingKeys: String, CodingKey {
		case id, name, overview
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
		case airDate = "air_date"
		case episodeNumber = "episode_number"
		case episodeType = "episode_type"
		case productionCode = "production_code"
		case runtime
		case seasonNumber = "season_number"
		case showID = "show_id"
		case stillPath = "still_path"
	}
}

// MARK: - ProductionCompany
public struct ProductionCompany: Codable {
	public let id: Int?
	public let logoPath: String?
	public let name, originCountry: String?

	enum CodingKeys: String, CodingKey {
		case id
		case logoPath = "logo_path"
		case name
		case originCountry = "origin_country"
	}
}

// MARK: - ProductionCountry
public struct ProductionCountry: Codable {
	public let iso3166_1, name: String?

	enum CodingKeys: String, CodingKey {
		case iso3166_1 = "iso_3166_1"
		case name
	}
}


// MARK: - SpokenLanguage
public struct SpokenLanguage: Codable {
	public let englishName, iso639_1, name: String?

	enum CodingKeys: String, CodingKey {
		case englishName = "english_name"
		case iso639_1 = "iso_639_1"
		case name
	}
}
