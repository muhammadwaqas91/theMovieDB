//
//  VideoPlayerViewController.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 02/02/2025.
//

import Foundation
import UIKit
import AVKit

class VideoPlayerViewController: UIViewController {
	
	private var url: URL?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		playVideo()
	}
	
	init(url: URL) {
		self.url = url
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func playVideo() {
		guard let url else { return }

		let player = AVPlayer(url: url)
		let playerViewController = AVPlayerViewController()
		playerViewController.player = player

		// Present the video player
		present(playerViewController, animated: true) {
			player.play() // Auto-play the video
		}
	}
}
