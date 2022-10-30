//
//  RequestProtocol.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

import Foundation

/// Protocol for Request
protocol RequestProtocol {
	var path: String { get }
	var requestType: RequestType { get }
	var headers: [String: String] { get }
	var params: [String: Any] { get }
	var urlParams: [String: String?] { get }
}

// MARK: - Default RequestProtocol
extension RequestProtocol {
	var host: String {
		APIConstants.host
	}

	var params: [String: Any] {
		[:]
	}

	var urlParams: [String: String?] {
		[:]
	}

	var headers: [String: String] {
		[:]
	}

	func createURLRequest() throws -> URLRequest {
		var components = URLComponents()
		components.scheme = "https"
		components.host = host
		components.path = path

		if !urlParams.isEmpty {
			components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
		}

		guard let url = components.url else {
			throw  NetworkError.invalidURL
		}

		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = requestType.rawValue

		if !headers.isEmpty {
			urlRequest.allHTTPHeaderFields = headers
		}

		urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

		if !params.isEmpty {
			do {
				urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
			} catch let error {
				print(error)
			}
		}
		return urlRequest
	}
}
