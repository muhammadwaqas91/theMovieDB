//
//  TVEpisodeVM.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 31/01/2025.
//

import Foundation

struct TVEpisodeVM {
	let id: Int?
	let title: String?
	let episodeNumber: Int?
	let seasonNumber: Int?
	let overview: String?
	let airDate: String?
	let stillPath: String?
	let voteAverage: Double?
	let episodeUrl: URL?

	init(from episode: TVEpisode) {
		self.id = episode.id
		self.title = episode.name
		self.episodeNumber = episode.episodeNumber
		self.seasonNumber = episode.seasonNumber
		self.overview = episode.overview
		self.airDate = episode.airDate
		self.voteAverage = episode.voteAverage
		self.stillPath = episode.stillPath
		self.episodeUrl = URL(string: Constants.trailerURL)
	}
}


