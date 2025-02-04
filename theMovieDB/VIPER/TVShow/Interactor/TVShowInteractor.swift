//
//  TVShowInteractor.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//


// MARK: - Interactor Protocol
/// Interactor confirms to this
protocol TVShowInteractorProtocol {
	var output: TVShowInteractorOutputProtocol? { get set }
	func fetchShow(_ showId: Int)
	func fetchSeasonDetails(_ showId: Int, _ seasonNumber: Int)
}


// MARK: - Interactor (No strong reference to Presenter)
class TVShowInteractor: TVShowInteractorProtocol {
	weak var output: TVShowInteractorOutputProtocol?
	private let service: TVShowServiceProtocol
	private let seasonDetailsService: TVSeasonDetailsServiceProtocol

	init(service: TVShowServiceProtocol, seasonDetailsService: TVSeasonDetailsServiceProtocol) {
		self.service = service
		self.seasonDetailsService = seasonDetailsService
	}
	
	func fetchShow(_ showId: Int) {
		Task {
			do {
				let show = try await service.fetchTVShow(showId: showId)
				let tvShowVM = TVShowVM(from: show)
				await MainActor.run {
					output?.didFetchShow(tvShowVM)
				}
			} catch {
				await MainActor.run {
					output?.didFailToFetchShow(error)
				}
			}
		}
	}
	
	
	func fetchSeasonDetails(_ showId: Int, _ seasonNumber: Int) {
		Task {
			do {
				let season = try await seasonDetailsService.fetchSeasonDetails(showId, seasonNumber)
				let tvSeasonVM = TVSeasonVM(from: season)
				await MainActor.run {
					output?.didFetchSeasonDetails(tvSeasonVM)
				}
			} catch {
				await MainActor.run {
					output?.didFailToFetchSeasonDetails(error)
				}
			}
		}
	}
}
