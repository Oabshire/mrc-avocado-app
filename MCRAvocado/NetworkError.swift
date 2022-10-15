//
//  NetworkError.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

/// Network errors
public enum NetworkError: Error {
	case invalidURL
	case invalidServerResponse
	case failedToDecode

	public var errorDescription: String? {
		switch self {
		case .invalidServerResponse:
			return "The server returned an invalid response."
		case .invalidURL:
			return "URL string is malformed."
		case .failedToDecode:
			return "Something went wrong while decoding. Make sure the keys and types are correct."
		}
	}
}
