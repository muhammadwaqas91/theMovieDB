//
//  SampleExample.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

import Foundation
import UIKit

// MARK: - View Protocol
protocol SampleViewProtocol: AnyObject {
	func showData(_ data: String)
}

// MARK: - Presenter Protocol
protocol SamplePresenterProtocol: AnyObject {
	func fetchData()
}

// MARK: - Interactor Protocols
protocol SampleInteractorProtocol {
	var output: SampleInteractorOutputProtocol? { get set }
	func fetchData()
}

protocol SampleInteractorOutputProtocol: AnyObject {
	func didFetchData(_ data: String)
}

// MARK: - Router Protocol
protocol SampleRouterProtocol: AnyObject {
	var viewController: UIViewController? { get set }
	func navigateToDetail()
}

// MARK: - Presenter (Implements Interactor Output)
class SamplePresenter: SamplePresenterProtocol, SampleInteractorOutputProtocol {
	weak var view: SampleViewProtocol?
	var interactor: SampleInteractorProtocol?
	var router: SampleRouterProtocol?

	init(view: SampleViewProtocol, interactor: SampleInteractorProtocol, router: SampleRouterProtocol) {
		self.view = view
		self.interactor = interactor
		self.router = router
		self.interactor?.output = self  // Weak reference
	}

	func fetchData() {
		interactor?.fetchData()
	}

	func didFetchData(_ data: String) {
		view?.showData(data)
	}
}

// MARK: - Interactor (No strong reference to Presenter)
class SampleInteractor: SampleInteractorProtocol {
	weak var output: SampleInteractorOutputProtocol?  // Weak to avoid retain cycle

	func fetchData() {
		let data = "Sample Data"
		output?.didFetchData(data)  // Communicates result back
	}
}

// MARK: - View
class SampleViewController: UIViewController, SampleViewProtocol {
	var presenter: SamplePresenterProtocol?

	func showData(_ data: String) {
		print("Data Received: \(data)")
	}
}

// MARK: - Router
class SampleRouter: SampleRouterProtocol {
	weak var viewController: UIViewController?
	
	func navigateToDetail() {
		print("Navigating to detail screen")
	}
}

extension ModuleBuilder {
	static func buildSample() -> UIViewController {
		let interactor = SampleInteractor()
		let router = SampleRouter()
		let view = SampleViewController()
		let presenter = SamplePresenter(view: view, interactor: interactor, router: router)
		
		view.presenter = presenter
		interactor.output = presenter
		router.viewController = view
		
		return view
	}
}

