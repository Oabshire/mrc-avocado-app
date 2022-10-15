//
//  MenuRequest.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

/// Available requests
enum MenuRequest: RequestProtocol {
	case getAllMenu

	var path: String {
		"/api/sections"
	}

	var urlParams: [String: String?] {
		switch self {
		case .getAllMenu:
			return [:]
		}
	}

	var requestType: RequestType {
		.GET
	}
}
