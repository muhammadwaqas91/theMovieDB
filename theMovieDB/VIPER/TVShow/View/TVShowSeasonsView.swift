//
//  TVShowSeasonsView.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation
import UIKit

protocol TVShowSeasonsViewDelegate: AnyObject {
	func didSelectSeason(_ vm: TVSeasonVM)
}

final class TVShowSeasonsView: UIView {
	weak var delegate: TVShowSeasonsViewDelegate?
	private var tvSeasonVMs: [TVSeasonVM] = []
	private var selectedSeason: TVSeasonVM?
	private let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		layout.minimumInteritemSpacing = 10
		layout.estimatedItemSize = CGSize(width: 100, height: 40)
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = .clear
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			collectionView.heightAnchor.constraint(equalToConstant: 60)
		])
		return collectionView
	}()
	
	private lazy var mainStackView = UIStackView(
		arrangedSubviews: [collectionView],
		axis: .horizontal,
		spacing: 20,
		alignment: .center,
		distribution: .fill
	)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		setupCollectionView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupView() {
		addSubview(mainStackView)
		guard let superview = mainStackView.superview else { return }
		mainStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			mainStackView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
			mainStackView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
			mainStackView.topAnchor.constraint(equalTo: superview.topAnchor),
			mainStackView.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
		])
	}
	
	private func setupCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(TagCell<SeasonTag>.self, forCellWithReuseIdentifier: TagCell<SeasonTag>.reuseIdentifier)
	}
	
	func updateVMs(_ vms: [TVSeasonVM]?) {
		self.tvSeasonVMs = vms ?? []
		
		if selectedSeason == nil, let season = tvSeasonVMs.first {
			selectSeason(season)
			return
		}
		collectionView.reloadData()
	}
	
	private func selectSeason(_ season: TVSeasonVM) {
		selectedSeason = season
		delegate?.didSelectSeason(season)
		collectionView.reloadData()
	}
}

// MARK: - UICollectionViewDelegate & DataSource
extension TVShowSeasonsView: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return tvSeasonVMs.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell<SeasonTag>.reuseIdentifier, for: indexPath) as! TagCell<SeasonTag>
		cell.configure(with: SeasonTag(seasonNumber: tvSeasonVMs[indexPath.row].seasonNumber ?? 0))
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let current = tvSeasonVMs[indexPath.row]
		
		if let currentSeasonNumber = current.seasonNumber,
			selectedSeason?.seasonNumber ?? 0 != currentSeasonNumber {
			selectSeason(current)
		}
	}
}
