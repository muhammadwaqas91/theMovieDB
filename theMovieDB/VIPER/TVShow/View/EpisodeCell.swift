//
//  EpisodeCell.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation
import UIKit

final class EpisodeCell: UITableViewCell {
	static let identifier = "EpisodeCell"

	private let stillImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imageView.widthAnchor.constraint(equalToConstant: 120),
			imageView.heightAnchor.constraint(equalToConstant: 67.5),
		])
		return imageView
	}()
	
	private let episodeLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		label.textColor = .white
		return label
	}()

	private lazy var mainStackView = UIStackView(
		arrangedSubviews: [stillImageView, episodeLabel],
		axis: .horizontal,
		spacing: 12,
		alignment: .center,
		distribution: .fill
	)
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		selectionStyle = .none
		backgroundColor = .clear
		contentView.backgroundColor = .clear
		let bgView = UIView()
		bgView.backgroundColor = .white.withAlphaComponent(0.08)
		
		contentView.addSubview(bgView)
		guard let superview = bgView.superview else { return }
		bgView.pinToSuperviewEdges(padding: UIEdgeInsets(all: 4),
										  topAnchor: superview.topAnchor,
										  leadingAnchor: superview.leadingAnchor,
										  trailingAnchor: superview.trailingAnchor,
										  bottomAnchor: superview.bottomAnchor)
		
		bgView.addSubview(mainStackView)
		guard let superview = mainStackView.superview else { return }
		mainStackView.pinToSuperviewEdges(padding: .zero,
										  topAnchor: superview.topAnchor,
										  leadingAnchor: superview.leadingAnchor,
										  trailingAnchor: superview.trailingAnchor,
										  bottomAnchor: superview.bottomAnchor)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(_ vm: TVEpisodeVM) {
		stillImageView.setImage(baseURL: Constants.imageBaseURL_original,
								path: vm.stillPath,
								placeholder: stillImageView.placeholder,
								indicatorType: .activity)
		episodeLabel.text = vm.title
	}
}
