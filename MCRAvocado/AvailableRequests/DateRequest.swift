//
//  DateRequest.swift
//  MCRAvocado
//
//  Created by Onie on 02.11.2022.
//

/// Available Date requests
enum DateRequest: RequestProtocol {
	case getCurrentDate

	var path: String {
		"/api/currentDate"
	}

	var urlParams: [String: String?] {
		switch self {
		case .getCurrentDate:
			return [:]
		}
	}

	var requestType: RequestType {
		.GET
	}
}
