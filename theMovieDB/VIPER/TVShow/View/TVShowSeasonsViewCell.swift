//
//  TVShowSeasonsViewCell.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 03/02/2025.
//

import Foundation
import UIKit


class TVShowSeasonsViewCell: UITableViewCell {
	
	static let identifier = "TVShowSeasonsViewCell"
	
	lazy var seasonsView = TVShowSeasonsView()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupView() {
		selectionStyle = .none
		backgroundColor = .clear
		contentView.backgroundColor = .clear
		
		contentView.addSubview(seasonsView)
		seasonsView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			seasonsView.topAnchor.constraint(equalTo: contentView.topAnchor),
			seasonsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			seasonsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			seasonsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
	}
}
