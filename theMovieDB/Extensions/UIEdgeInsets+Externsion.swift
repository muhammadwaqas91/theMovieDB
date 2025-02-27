//
//  UIEdgeInsets+Externsion.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 02/02/2025.
//

import Foundation
import UIKit

public extension UIEdgeInsets {
  /// Apply the same value to all edges
  init(all: CGFloat) {
	self.init(top: all, left: all, bottom: all, right: all)
  }
  
  /// Apply the same value to top and bottom edges
  init(vertical: CGFloat) {
	self.init(top: vertical, left: 0, bottom: vertical, right: 0)
  }
  
  /// Apply the same value to left and right edges
  init(horizontal: CGFloat) {
	self.init(top: 0, left: horizontal, bottom: 0, right: horizontal)
  }
  
  /// Apply the same value for left/right and top/bottom edges
  init(horizontal: CGFloat, vertical: CGFloat) {
	self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
  }
}

public extension UIEdgeInsets {
  /// Returns vertical edges dimensions combined
  var vertical: CGFloat {
	top + bottom
  }
  
  /// Returns horizontal edges dimensions combined
  var horizontal: CGFloat {
	left + right
  }
}
