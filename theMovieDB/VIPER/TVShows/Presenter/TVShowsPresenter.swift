//
//  TVShowsPresenter.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

// MARK: - Presenter Protocol
/// Presenter confirms to this
protocol TVShowsPresenterProtocol: AnyObject {
	func fetchTVShows()
	func didSelectShow(_ show: TVShowVM)
	func didScrollToEnd()
}

// MARK: - InteractorOutput Protocol
/// Presenter confirms to this
protocol TVShowsInteractorOutputProtocol: AnyObject {
	func didFetchTVShows(_ tvShowVMs: [TVShowVM])
	func didFailToFetchTVShows(error: Error)
}

// MARK: - Presenter (Implements Presenter and Interactor Output protocols)
class TVShowsPresenter {
	weak var view: TVShowsViewProtocol?
	var interactor: TVShowsInteractorProtocol?
	var router: TVShowsRouterProtocol?
	
	init(view: TVShowsViewProtocol, interactor: TVShowsInteractorProtocol, router: TVShowsRouterProtocol) {
		self.view = view
		self.interactor = interactor
		self.router = router
		self.interactor?.output = self
	}
}

extension TVShowsPresenter: TVShowsPresenterProtocol {
	func fetchTVShows() {
		interactor?.fetchTVShows()
	}
	
	func didSelectShow(_ show: TVShowVM) {
		router?.navigateToShow(show.id)
	}
	
	func didScrollToEnd() {
		interactor?.loadNextPage()
	}
}

extension TVShowsPresenter: TVShowsInteractorOutputProtocol {
	func didFetchTVShows(_ tvShowVMs: [TVShowVM]) {
		view?.displayTVShows(tvShowVMs)
	}
	
	func didFailToFetchTVShows(error: Error) {
		view?.displayError(error.localizedDescription)
	}
}
