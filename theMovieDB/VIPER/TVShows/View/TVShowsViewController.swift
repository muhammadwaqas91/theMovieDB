//
//  ShowDetailsViewController.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import UIKit

// MARK: - View Protocol
/// View confirms to this
protocol TVShowsViewProtocol: AnyObject {
	var presenter: TVShowsPresenterProtocol? { get set }
	func displayTVShows(_ shows: [TVShowVM])
	func displayError(_ message: String)
}

class TVShowsViewController: UIViewController {
	var presenter: TVShowsPresenterProtocol?
	var tvShows: [TVShowVM] = []
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Popular TV Shows"
		label.font = UIFont.boldSystemFont(ofSize: 24)
		label.textAlignment = .center
		return label
	}()

	let tableView: UITableView = {
		let table = UITableView()
		table.register(TVShowsTableViewCell.self, forCellReuseIdentifier: TVShowsTableViewCell.identifier)
		table.backgroundColor = .clear
		return table
	}()

	let loadingIndicator = UIActivityIndicatorView(style: .large)

	private lazy var contentStackView = UIStackView(
		arrangedSubviews: [titleLabel, tableView],
		axis: .vertical,
		spacing: 10,
		alignment: .fill,
		distribution: .fill
	)

	private lazy var wrapperStackView = UIStackView(
		arrangedSubviews: [contentStackView, loadingIndicator],
		axis: .vertical,
		spacing: 20,
		alignment: .fill,
		distribution: .fillProportionally
	)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		presenter?.fetchTVShows()
	}
	
	private func setupUI() {
		view.backgroundColor = .systemBackground
		view.addSubview(wrapperStackView)
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.prefetchDataSource = self
		
		guard let superview = wrapperStackView.superview else { return }
		wrapperStackView.pinToSuperviewEdges(padding: .zero,
											 topAnchor: superview.safeAreaLayoutGuide.topAnchor,
											 leadingAnchor: superview.leadingAnchor,
											 trailingAnchor: superview.trailingAnchor,
											 bottomAnchor: superview.bottomAnchor)
	}
}

extension TVShowsViewController: TVShowsViewProtocol {
	func displayTVShows(_ tvShows: [TVShowVM]) {
		self.tvShows = tvShows
		tableView.reloadData()
		loadingIndicator.stopAnimating()
	}
	
	func displayError(_ message: String) {
		let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}
}

extension TVShowsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tvShows.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: TVShowsTableViewCell.identifier, for: indexPath) as? TVShowsTableViewCell else {
			return UITableViewCell()
		}
		cell.configure(with: tvShows[indexPath.row])
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedShow = tvShows[indexPath.row]
		presenter?.didSelectShow(selectedShow)
	}
}

extension TVShowsViewController: UITableViewDataSourcePrefetching {
	func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		let lastIndex = tvShows.count - 1
		if indexPaths.contains(where: { $0.row >= lastIndex }) {
			presenter?.didScrollToEnd()
		}
	}
}
