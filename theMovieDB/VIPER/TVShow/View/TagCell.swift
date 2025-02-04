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
final class TagCell<T: TagCellConfigurable>: UICollectionViewCell, ReusableCell {
	
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
	
	private lazy var mainStackView = UIStackView(
		arrangedSubviews: [titleLabel],
		axis: .horizontal,
		spacing: 0,
		alignment: .fill,
		distribution: .fill,
		edgeInsets: UIEdgeInsets(all: 8)
	)

	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(mainStackView)
		contentView.backgroundColor = .darkGray
		
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
		contentView.layer.cornerRadius = contentView.frame.height / 2
	}

	func configure(with item: T) {
		titleLabel.text = item.displayText
	}
}
