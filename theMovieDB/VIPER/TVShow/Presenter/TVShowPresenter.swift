//
//  TVShowPresenter.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

import Foundation
import UIKit

// MARK: - Presenter Protocol
/// Presenter confirms to this
protocol TVShowPresenterProtocol: AnyObject {
	func backAction()
	func fetchShow(_ showId: Int)
	func playVideo(_ url: URL?)
	func playTrailer(_ url: URL?)
	func fetchSeasonDetails(_ showId: Int, _ seasonNumber: Int)
	func playEpisode(_ url: URL?)
}

// MARK: - InteractorOutput Protocol
/// Presenter confirms to this
protocol TVShowInteractorOutputProtocol: AnyObject {
	func didFetchShow(_ tvShowVM: TVShowVM)
	func didFailToFetchShow(_ error: Error)
	func didFetchSeasonDetails(_ season: TVSeasonVM)
	func didFailToFetchSeasonDetails(_ error: Error)
}

// MARK: - Presenter (Implements Presenter and Interactor Output protocols)
class TVShowPresenter {
	weak var view: TVShowViewProtocol?
	var interactor: TVShowInteractorProtocol?
	var router: TVShowRouterProtocol?
	var videoRouter: VideoPlayerRouterProtocol?
	
	init(view: TVShowViewProtocol, interactor: TVShowInteractorProtocol, router: TVShowRouterProtocol, videoRouter: VideoPlayerRouterProtocol) {
		self.view = view
		self.interactor = interactor
		self.router = router
		self.videoRouter = videoRouter
		self.interactor?.output = self  // Weak reference
	}
}

extension TVShowPresenter: TVShowPresenterProtocol {
	func backAction() {
		router?.popViewController()
	}
	
	func fetchShow(_ showId: Int) {
		interactor?.fetchShow(showId)
	}
	
	func playVideo(_ url: URL?) {
		videoRouter?.openVideoPlayer(url)
	}
	
	func playTrailer(_ url: URL?) {
		videoRouter?.openVideoPlayer(url)
	}
	
	func fetchSeasonDetails(_ showId: Int, _ seasonNumber: Int) {
		interactor?.fetchSeasonDetails(showId, seasonNumber)
	}
	
	func playEpisode(_ url: URL?) {
		videoRouter?.openVideoPlayer(url)
	}
}

extension TVShowPresenter: TVShowInteractorOutputProtocol {
	func didFetchShow(_ show: TVShowVM) {
		view?.displayShow(show)
	}
	
	func didFailToFetchShow(_ error: Error) {
		view?.displayShowError(error.localizedDescription)
	}
	
	func didFetchSeasonDetails(_ season: TVSeasonVM) {
		view?.displaySeasonDetails(season)
	}
	
	func didFailToFetchSeasonDetails(_ error: any Error) {
		view?.displaySeasonDetailsError(error.localizedDescription)
	}
}

