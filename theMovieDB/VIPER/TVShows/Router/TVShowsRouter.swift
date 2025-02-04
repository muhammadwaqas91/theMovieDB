//
//  TVShowsRouter.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

import UIKit

// MARK: - Router Protocol
/// Router confirms to this
protocol TVShowsRouterProtocol: AnyObject {
	func navigateToShow(_ showId: Int)
}

class TVShowsRouter: TVShowsRouterProtocol {
	weak var viewController: UIViewController?
	func navigateToShow(_ showId: Int) {
		let detailsVC = ModuleBuilder.buildShow(showId)
		viewController?.navigationController?.pushViewController(detailsVC, animated: true)
	}
}
