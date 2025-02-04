//
//  UIImageView+Extension.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 01/02/2025.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
	var placeholder: UIImage? {
		UIImage(systemName: "photo")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
	}
	
	func setImage(baseURL: String, path: String?, placeholder: UIImage? = nil, indicatorType: IndicatorType = .none) {
		guard let path, let url = URL(string: baseURL + path), url.isValid  else { return }
		
		kf.indicatorType = indicatorType
		kf.setImage(with: url, placeholder: placeholder)
	}
}
