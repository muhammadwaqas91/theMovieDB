//
//  TVSeasonVM.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 31/01/2025.
//

import Foundation

struct TVSeasonVM {
	let id: String?
	let seasonNumber: Int?
	let name: String?
	let airDate: String?
	let posterURL: URL?
	let overview: String?
	let episodeCount: Int?
	let episodeVMs: [TVEpisodeVM]?
	init(from season: TVSeason) {
		self.id = season.id
		self.seasonNumber = season.seasonNumber
		self.name = season.name
		self.airDate = season.airDate
		self.overview = season.overview
		self.episodeCount = season.episodes?.count
		self.posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(season.posterPath ?? "")")
		episodeVMs = season.episodes?.compactMap({TVEpisodeVM(from: $0)})
	}
}
