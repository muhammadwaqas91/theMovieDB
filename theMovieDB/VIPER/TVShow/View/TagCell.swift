//
//  TagCell.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation
import UIKit

import UIKit

// MARK: - Protocol for Reusability
protocol ReusableCell {
	static var reuseIdentifier: String { get }
}

// MARK: - Protocol for Configurable Data
protocol TagCellConfigurable {
	var displayText: String { get }
}

// MARK: - Generic CollectionView Cell
class TagCell<T: TagCellConfigurable>: UICollectionViewCell, ReusableCell {
	
	static var reuseIdentifier: String {
		return String(describing: self)
	}

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
		label.textColor = .white
		label.textAlignment = .center
		return label
	}()
	private lazy var containerView: UIView = {
		let view = UIView()
		view.backgroundColor = .darkGray
		view.clipsToBounds = true
		view.addSubview(titleLabel)
		titleLabel.pinToSuperviewEdges(padding: UIEdgeInsets(all: 8), topAnchor: view.topAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: view.bottomAnchor)
		
		return view
	}()
	
	private lazy var mainStackView = UIStackView(
		arrangedSubviews: [containerView],
		axis: .horizontal,
		spacing: 0,
		alignment: .fill,
		distribution: .fill
	)

	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(mainStackView)
		backgroundColor = .clear
		contentView.backgroundColor = .clear
		
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
	
	override func layoutSubviews() {
		super.layoutSubviews()
		containerView.layer.cornerRadius = containerView.frame.height / 2
	}

	func configure(with item: T) {
		titleLabel.text = item.displayText
	}
}
