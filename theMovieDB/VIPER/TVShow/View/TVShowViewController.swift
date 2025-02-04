//
//  ShowDetailsViewController.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import UIKit



// MARK: - View Protocol
/// View confirms to this
protocol TVShowViewProtocol: AnyObject {
	var presenter: TVShowPresenterProtocol? { get set }
	func displayShow(_ show: TVShowVM)
	func displayShowError(_ message: String)
	func displaySeasonDetails(_ season: TVSeasonVM)
	func displaySeasonDetailsError(_ message: String)
}

class TVShowViewController: UIViewController, TVShowViewProtocol {
	private let tableView = UITableView(frame: .zero, style: .plain)

	private var tvShowVM: TVShowVM?
	private var seasons: [TVSeasonVM] {
		get {
			tvShowVM?.tvSeasonVMs ?? []
		}
	}
	private var episodes: [TVEpisodeVM] = []
	
	private func setupTableView() {
		view.addSubview(tableView)
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorStyle = .none
		tableView.backgroundColor = .clear
		tableView.register(TVShowHeaderViewCell.self, forCellReuseIdentifier: TVShowHeaderViewCell.identifier)
		tableView.register(TVShowSeasonsViewCell.self, forCellReuseIdentifier: TVShowSeasonsViewCell.identifier)
		tableView.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.identifier)
		
		tableView.contentInsetAdjustmentBehavior = .never
		tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
	
	private let backButton: UIButton = {
		let button = UIButton(type: .custom)
		button.setImage(UIImage(systemName: "arrow.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
		button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
		return button
	}()
	
	@objc private func backAction() {
		presenter?.backAction()
	}
	
	private lazy var backStackView = UIStackView(
		arrangedSubviews: [backButton, UIView()],
		axis: .horizontal,
		spacing: 8,
		alignment: .fill,
		distribution: .fill,
		edgeInsets: UIEdgeInsets(horizontal: 16)
	)
	
	var presenter: TVShowPresenterProtocol?
	var showId: Int
	
	init(_ showId: Int) {
		self.showId = showId
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		presenter?.fetchShow(showId)
	}

	private func setupUI() {
		view.backgroundColor = .black
		setupTableView()
		view.addSubview(backStackView)
		guard let superview = backStackView.superview else { return }
		backStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			backStackView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
			backStackView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
			backStackView.topAnchor.constraint(equalTo: superview.topAnchor)
		])
	}
	
	func displayShow(_ show: TVShowVM) {
		updateVM(show)
	}
	
	func displayShowError(_ message: String) {
		showAlert(message: message)
	}
	
	func displaySeasonDetails(_ season: TVSeasonVM) {
		episodes = season.episodeVMs ?? []
		tableView.reloadData()
	}
	
	func displaySeasonDetailsError(_ message: String) {
		showAlert(message: message)
	}
	
	func updateVM(_ vm: TVShowVM) {
		tvShowVM = vm
		tableView.reloadData()
	}
}

extension TVShowViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		var sections = 0
		if tvShowVM != nil { sections += 1 }
		if !seasons.isEmpty { sections += 1 }
		if !episodes.isEmpty { sections += 1 }
		return sections
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0, tvShowVM != nil { return 1 }
		if section == 1, !seasons.isEmpty { return 1 }
		if section == 2, !episodes.isEmpty { return episodes.count }
		return 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.section {
		case 0:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: TVShowHeaderViewCell.identifier, for: indexPath) as? TVShowHeaderViewCell,
				  let tvShowVM
			else { return UITableViewCell() }
			cell.headerView.delegate = self
			cell.headerView.updateVM(tvShowVM)
			return cell
		case 1:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: TVShowSeasonsViewCell.identifier, for: indexPath) as? TVShowSeasonsViewCell else { return UITableViewCell() }
			cell.seasonsView.delegate = self
			cell.seasonsView.updateVMs(seasons)
			return cell
		default:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier, for: indexPath) as? EpisodeCell else { return UITableViewCell() }
			cell.configure(episodes[indexPath.row])
			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.section == 2 {
			didSelectEpisode(episodes[indexPath.row])
		}
	}
}

extension TVShowViewController: TVShowHeaderViewDelegate {
	func playVideo(_ url: URL?) {
		presenter?.playVideo(url)
	}
	
	func playTrailer(_ url: URL?) {
		presenter?.playTrailer(url)
	}
}

extension TVShowViewController: TVShowSeasonsViewDelegate {
	func didSelectSeason(_ vm: TVSeasonVM) {
		presenter?.fetchSeasonDetails(showId, vm.seasonNumber ?? 0)
	}
	
	func didSelectEpisode(_ vm: TVEpisodeVM) {
		presenter?.playEpisode(vm.episodeUrl)
	}
}
