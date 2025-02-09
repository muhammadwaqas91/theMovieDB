//
//  TVShowsVM.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 31/01/2025.
//

import Foundation

/// ViewModel for handling a paginated list of TV shows.
class TVShowsVM {
	private(set) var tvShows: [TVShowVM] = []
	private(set) var currentPage: Int = 0
	private(set) var totalPages: Int = 1
	private var isFetching = false

	init() {}

	/// Resets the list when fetching the first page
	func resetPagination() {
		currentPage = 0
		totalPages = 1
		tvShows.removeAll()
	}

	/// Checks if a new page should be loaded
	var shouldLoadNextPage: Bool {
		return !isFetching && currentPage < totalPages
	}
	
	/// Updates the model with new results and pagination data
	func update(with response: TVShows) {
		currentPage = response.page
		totalPages = response.totalPages
		tvShows.append(contentsOf: response.results.map { TVShowVM(from: $0) })
	}

	/// Prevents duplicate fetch requests
	func setFetchingState(_ isFetching: Bool) {
		self.isFetching = isFetching
	}
}

