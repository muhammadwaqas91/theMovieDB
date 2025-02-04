//
//  TVSeasonDetailsService.swift
//  theMovieDB
//
//  Created by Muhammad Waqas on 30/01/2025.
//

import Foundation
import RestAPIFramework

public protocol TVSeasonDetailsServiceProtocol {
	func fetchSeasonDetails(_ showId: Int, _ seasonNumber: Int) async throws -> TVSeason
}

public class TVSeasonService: TVSeasonDetailsServiceProtocol {
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
	
	public func fetchSeasonDetails(_ showId: Int, _ seasonNumber: Int) async throws -> TVSeason {
		let request = TVSeasonRequest(
			baseURL: baseURL,
			accessToken: accessToken, showId: showId,
			seasonNumber: seasonNumber
		)
		return try await networkClient.execute(TVSeason.self, request: request, parser: parser)
	}
}
