//
//  TVShowsInteractor.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

// MARK: - Interactor Protocol
/// Interactor confirms to this
protocol TVShowsInteractorProtocol {
	var output: TVShowsInteractorOutputProtocol? { get set }
	func fetchTVShows()
	func loadNextPage()
}

// MARK: - Interactor (No strong reference to Presenter)
class TVShowsInteractor: TVShowsInteractorProtocol {
	weak var output: TVShowsInteractorOutputProtocol?
	
	private let tvShowsVM = TVShowsVM()
	private let service: TVShowsServiceProtocol
	
	init(service: TVShowsServiceProtocol) {
		self.service = service
	}
	
	func fetchTVShows() {
		tvShowsVM.resetPagination()
		requestTVShows()
	}
	
	func loadNextPage() {
		guard tvShowsVM.shouldLoadNextPage else { return }
		requestTVShows()
	}
	
	private func requestTVShows() {
		tvShowsVM.setFetchingState(true)
		
		Task {
			do {
				let response = try await service.fetchPopularShows(page: tvShowsVM.currentPage + 1)
				tvShowsVM.update(with: response)
				tvShowsVM.setFetchingState(false)
				
				await MainActor.run {
					output?.didFetchTVShows(tvShowsVM.tvShows)
				}
			} catch {
				tvShowsVM.setFetchingState(false)
				await MainActor.run {
					output?.didFailToFetchTVShows(error: error)
				}
			}
		}
	}
}
