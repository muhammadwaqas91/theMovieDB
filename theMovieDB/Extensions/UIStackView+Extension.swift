//
//  UIView+Extension.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation
import UIKit

extension UIStackView {
	convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, edgeInsets: UIEdgeInsets? = nil) {
		self.init(arrangedSubviews: arrangedSubviews)
		self.axis = axis
		self.spacing = spacing
		self.alignment = alignment
		self.distribution = distribution
		if let edgeInsets {
			self.updateLayoutMargins(edgeInsets)
		}
	}
	
	func updateLayoutMargins(_ layoutMargins: UIEdgeInsets) {
		preservesSuperviewLayoutMargins = false
		isLayoutMarginsRelativeArrangement = true
		
		self.layoutMargins = layoutMargins
	}
}
