//
//  TVShowsService.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation
import RestAPIFramework

public protocol TVShowsServiceProtocol {
	func fetchPopularShows(page: Int) async throws -> TVShows
}

public class TVShowsService: TVShowsServiceProtocol {
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
	
	public func fetchPopularShows(page: Int) async throws -> TVShows {
		let request = PopularTVShowsRequest(
			baseURL: baseURL,
			accessToken: accessToken, page: page
		)
		return try await networkClient.execute(TVShows.self, request: request, parser: parser)
	}
}
