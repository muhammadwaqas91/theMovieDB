//
//  TVShowService.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation
import RestAPIFramework

public protocol TVShowServiceProtocol {
	func fetchTVShow(showId: Int) async throws -> TVShow
}

public class TVShowService: TVShowServiceProtocol {
	private let baseURL: String
	private let accessToken: String
	private let networkClient: NetworkClientProtocol
	private let parser: DataParserProtocol
	
	/// Inject dependencies (network client & parser) for flexibility & testability.
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
	
	public func fetchTVShow(showId: Int) async throws -> TVShow {
		let request = TVShowRequest(
			baseURL: baseURL,
			accessToken: accessToken, showId: showId
		)
		return try await networkClient.execute(TVShow.self, request: request, parser: parser)
	}
}
