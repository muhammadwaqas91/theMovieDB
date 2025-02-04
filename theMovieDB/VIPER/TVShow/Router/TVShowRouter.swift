//
//  TVShowRouter.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

import UIKit

// MARK: - Router Protocol
/// Router confirms to this
protocol TVShowRouterProtocol: AnyObject {
	func popViewController()
}

// MARK: - Router
class TVShowRouter: TVShowRouterProtocol {
	weak var viewController: UIViewController?
	func popViewController() {
		viewController?.navigationController?.popViewController(animated: true)
	}
}
