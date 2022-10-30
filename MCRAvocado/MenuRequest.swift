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

/// Available requests
enum PostOrderRequest: RequestProtocol {

	case postOrder(params: [String: Any])

	var path: String {
		"/api/orders"
	}

	var urlParams: [String: String?] {
		switch self {
		case .postOrder:
			return [:]
		}
	}

	var params: [String: Any] {
		switch self {
		case .postOrder(let params):
			return params
		}
	}

	var requestType: RequestType {
		.POST
	}
}
