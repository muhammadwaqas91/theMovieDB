//
//  UIView+Extension.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation
import UIKit

extension UIView {
	func pinToSuperviewEdges(padding: UIEdgeInsets = .zero, topAnchor: NSLayoutYAxisAnchor, leadingAnchor: NSLayoutXAxisAnchor, trailingAnchor: NSLayoutXAxisAnchor, bottomAnchor: NSLayoutYAxisAnchor) {
		guard superview != nil else {
			print("❌ Error: `superview` is nil. Ensure the view is added to a superview before calling \(#function)")
			return
		}
		
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top),
			self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left),
			self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right),
			self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
		])
	}
}
