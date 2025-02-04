//
//  ModuleBuilder.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation
import UIKit

final class ModuleBuilder {
	static func buildShows(_ page: Int) -> UIViewController {
		let service = TVShowsService(baseURL: Constants.baseURL, accessToken: Constants.accessToken)
		let interactor = TVShowsInteractor(service: service)
		let router = TVShowsRouter()
		let view = TVShowsViewController()
		let presenter = TVShowsPresenter(view: view, interactor: interactor, router: router)
		
		view.presenter = presenter
		interactor.output = presenter
		router.viewController = view
		
		return view
	}
	
	static func buildShow(_ showId: Int) -> UIViewController {
		let service = TVShowService(baseURL: Constants.baseURL,
									accessToken: Constants.accessToken)
		let seasonDetailService = TVSeasonService(baseURL: Constants.baseURL,
												  accessToken: Constants.accessToken)
		let interactor = TVShowInteractor(service: service,
										  seasonDetailsService: seasonDetailService)
		let router = TVShowRouter()
		let videoRouter = VideoPlayerRouter()
		let view = TVShowViewController(showId)
		let presenter = TVShowPresenter(view: view, interactor: interactor, router: router, videoRouter: videoRouter)
		
		view.presenter = presenter
		interactor.output = presenter
		router.viewController = view
		videoRouter.viewController = view
		
		return view
	}
}
