//
//  TVShowsTableViewCell.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation
import UIKit

final class TVShowsTableViewCell: UITableViewCell {
	static let identifier = "TVShowsTableViewCell"

	private let posterImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.layer.cornerRadius = 10
		imageView.clipsToBounds = true
		
		imageView.widthAnchor.constraint(equalToConstant: 92).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
		return imageView
	}()

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.numberOfLines = 2
		label.textAlignment = .left
		return label
	}()

	private let releaseDateLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = .gray
		return label
	}()

	private let ratingLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = .white
		label.textAlignment = .center
		label.backgroundColor = UIColor.black.withAlphaComponent(0.2)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.widthAnchor.constraint(equalToConstant: 40),
			label.heightAnchor.constraint(equalToConstant: 40)
		])
		label.clipsToBounds = true
		label.layer.cornerRadius = label.frame.width / 2
		return label
	}()
	
	private lazy var textStackView = UIStackView(
		arrangedSubviews: [titleLabel, releaseDateLabel, ratingLabel],
		axis: .vertical,
		spacing: 5,
		alignment: .leading,
		distribution: .fill
	)

	private lazy var mainStackView = UIStackView(
		arrangedSubviews: [posterImageView, textStackView],
		axis: .horizontal,
		spacing: 12,
		alignment: .center,
		distribution: .fill,
		edgeInsets: UIEdgeInsets(all: 8)
	)

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.addSubview(mainStackView)
		guard let superview = mainStackView.superview else { return }
		mainStackView.pinToSuperviewEdges(padding: .zero,
										  topAnchor: superview.topAnchor,
										  leadingAnchor: superview.leadingAnchor,
										  trailingAnchor: superview.trailingAnchor,
										  bottomAnchor: superview.bottomAnchor)
		selectionStyle = .none
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		ratingLabel.layer.cornerRadius = ratingLabel.frame.width / 2
	}
	
	func configure(with show: TVShowVM) {
		titleLabel.text = show.name
		releaseDateLabel.text = show.year
		
		let attrString = NSMutableAttributedString()
		attrString.append(NSAttributedString(string: "\(show.ratingPercentage ?? 0)",
						   attributes: [
							.font: UIFont.systemFont(ofSize: 16, weight: .bold),
							.foregroundColor: UIColor.black
						   ]))
		
		attrString.append(NSAttributedString(string: "%",
						   attributes: [
							.font: UIFont.systemFont(ofSize: 6, weight: .bold),
							.foregroundColor: UIColor.black,
							.baselineOffset: 6.0
						   ]))
		
		ratingLabel.attributedText = attrString
		posterImageView.setImage(baseURL: Constants.posterBaseURL_w92,
								 path: show.posterPath,
								 placeholder: posterImageView.placeholder,
								 indicatorType: .activity)
	}
}
