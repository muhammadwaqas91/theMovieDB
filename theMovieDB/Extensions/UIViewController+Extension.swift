//
//  UIViewController+Extension.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 04/02/2025.
//

import Foundation
import UIKit

extension UIViewController {
	func showAlert(title: String = "Error", message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}
}
