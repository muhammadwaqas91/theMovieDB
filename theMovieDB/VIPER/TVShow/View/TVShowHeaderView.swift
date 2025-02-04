//
//  TVShowHeaderView.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation
import UIKit
import AVKit

protocol TVShowHeaderViewDelegate: AnyObject {
	func playVideo(_ url: URL?)
	func playTrailer(_ url: URL?)
}

class TVShowHeaderView: UIView {
	private let backDropImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	private let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 24)
		label.textColor = .systemGray
		label.numberOfLines = 2
		return label
	}()
	
	private let detailsLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = .lightGray
		return label
	}()
	
	private let playButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("▶ Play", for: .normal)
		button.backgroundColor = UIColor.systemOrange
		button.layer.cornerRadius = 5
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
		return button
	}()
	
	private let trailerButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("🎬 Trailer", for: .normal)
		button.backgroundColor = UIColor.darkGray
		button.layer.cornerRadius = 5
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(playTrailer), for: .touchUpInside)
		return button
	}()
	
	private let descriptionLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = .lightText
		label.numberOfLines = 0
		return label
	}()
	
	private lazy var buttonsStackView = UIStackView(
		arrangedSubviews: [playButton, trailerButton],
		axis: .horizontal,
		spacing: 10,
		alignment: .fill,
		distribution: .fillEqually
	)
	
	private lazy var textStackView = UIStackView(
		arrangedSubviews: [nameLabel, detailsLabel, buttonsStackView, descriptionLabel],
		axis: .vertical,
		spacing: 10,
		alignment: .fill,
		distribution: .fill,
		edgeInsets: UIEdgeInsets(horizontal: 10)
	)
	
	private lazy var mainStackView = UIStackView(
		arrangedSubviews: [backDropImageView, textStackView],
		axis: .vertical,
		spacing: 15,
		alignment: .fill,
		distribution: .fill
	)
	
	private var vm: TVShowVM?

	weak var delegate: TVShowHeaderViewDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupView() {
		addSubview(mainStackView)
		guard let superview = mainStackView.superview else { return }
		mainStackView.pinToSuperviewEdges(padding: .zero,
										  topAnchor: superview.topAnchor,
										  leadingAnchor: superview.leadingAnchor,
										  trailingAnchor: superview.trailingAnchor,
										  bottomAnchor: superview.bottomAnchor)
		
		backDropImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			backDropImageView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
			backDropImageView.heightAnchor.constraint(equalTo: backDropImageView.widthAnchor, multiplier: 9.0/16.0),
		])
	}
	
	func updateVM(_ vm: TVShowVM) {
		self.vm = vm
		backDropImageView.setImage(baseURL: Constants.imageBaseURL_original,
								   path: vm.backdropPath,
								   placeholder: backDropImageView.placeholder,
								   indicatorType: .activity)
		nameLabel.text = vm.name
		detailsLabel.text = vm.details
		descriptionLabel.text = vm.overview
	}

	@objc private func playVideo() {
		guard let path = vm?.trailerPath, let url = URL(string: path) else { return }
		delegate?.playVideo(url)
	}
	
	@objc private func playTrailer() {
		guard let path = vm?.trailerPath, let url = URL(string: path) else { return }
		delegate?.playTrailer(url)
	}
}
