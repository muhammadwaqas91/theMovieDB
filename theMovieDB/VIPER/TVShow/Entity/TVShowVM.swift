//
//  TVShowVM.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 31/01/2025.
//

import Foundation

struct TVShowVM {
	let id: Int
	let backdropPath: String?
	let name: String?
	let year: String?
	let numberOfSeasons: Int?
	let overview: String?
	let posterPath: String?
	let ratingPercentage: Int?
	let trailerPath: String?
	let details: String?
	let tvSeasonVMs: [TVSeasonVM]?
	
	init(from tvShow: TVShow) {
		id = tvShow.id ?? 0
		backdropPath = tvShow.backdropPath
		name = tvShow.name
		year = tvShow.firstAirDate?.components(separatedBy: "-").first
		numberOfSeasons = tvShow.numberOfSeasons
		overview = tvShow.overview
		posterPath = tvShow.posterPath
		ratingPercentage = Int(((tvShow.voteAverage ?? 0) * 10).rounded())
		trailerPath = Constants.trailerURL 
		let numberOfSeasons = tvShow.numberOfSeasons ?? 0
		let seasonsText = ("\(numberOfSeasons) Season") + (numberOfSeasons > 1 ? "s" : "")
		details = "\(year ?? "") | \(seasonsText)"
		tvSeasonVMs = tvShow.seasons?.compactMap({TVSeasonVM(from: $0)})
	}
}

