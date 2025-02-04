//
//  TVEpisodeService.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation
import RestAPIFramework

public protocol TVEpisodeServiceProtocol {
	func fetchTVEpisode(showId: Int, seasonNumber: Int, episodeNumber: Int) async throws -> TVEpisode
}

public class TVEpisodeService: TVEpisodeServiceProtocol {
	private let baseURL: String
	private let accessToken: String
	private let networkClient: NetworkClientProtocol
	private let parser: DataParserProtocol
	
	public init(
		baseURL: String,
		accessToken: String,
		networkClient: NetworkClientProtocol = NetworkClient(),
		parser: DataParserProtocol = DataParser()
	) {
		self.baseURL = baseURL
		self.accessToken = accessToken
		self.networkClient = networkClient
		self.parser = parser
	}
	
	public func fetchTVEpisode(showId: Int, seasonNumber: Int, episodeNumber: Int) async throws -> TVEpisode {
		let request = TVEpisodeRequest(
			baseURL: baseURL,
			accessToken: accessToken, showId: showId,
			seasonNumber: seasonNumber,
			episodeNumber: episodeNumber
		)

		return try await networkClient.execute(TVEpisode.self, request: request, parser: parser)
	}
}
