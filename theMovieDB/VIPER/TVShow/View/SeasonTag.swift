//
//  SeasonTag.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation

struct SeasonTag: TagCellConfigurable {
	let seasonNumber: Int

	var displayText: String {
		return "Season \(seasonNumber)"
	}
}
