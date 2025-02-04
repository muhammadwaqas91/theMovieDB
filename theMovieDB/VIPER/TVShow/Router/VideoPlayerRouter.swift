//
//  VideoPlayerRouter.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 02/02/2025.
//

import Foundation
import UIKit
import AVKit

protocol VideoPlayerRouterProtocol: AnyObject {
	func openVideoPlayer(_ url: URL?)
}

class VideoPlayerRouter: VideoPlayerRouterProtocol {
	weak var viewController: UIViewController?
	
	func openVideoPlayer(_ url: URL?) {
		guard let url else { return }

		let player = AVPlayer(url: url)
		let playerViewController = AVPlayerViewController()
		playerViewController.player = player

		// Present the video player
		viewController?.present(playerViewController, animated: true) {
			player.play() // Auto-play the video
		}
	}
}
