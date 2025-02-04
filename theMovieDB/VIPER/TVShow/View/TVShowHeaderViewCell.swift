//
//  TVShowHeaderViewCell.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

import UIKit

class TVShowHeaderViewCell: UITableViewCell {
	
	static let identifier = "TVShowHeaderViewCell"
	
	lazy var headerView = TVShowHeaderView()
	
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
		
		contentView.addSubview(headerView)
		headerView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
			headerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
	}
}
