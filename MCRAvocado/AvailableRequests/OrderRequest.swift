//
//  OrderRequest.swift
//  MCRAvocado
//
//  Created by Onie on 31.10.2022.
//

/// Available Order request
enum OrderRequest: RequestProtocol {

	case postOrder(params: [String: Any])
	case getOrder

	var path: String {
		"/api/orders"
	}

	var urlParams: [String: String?] {
		switch self {
		case .postOrder, .getOrder:
			return [:]
		}
	}

	var params: [String: Any] {
		switch self {
		case .postOrder(let params):
			return params
		case .getOrder:
			return [:]
		}
	}

	var requestType: RequestType {
		switch self {
		case .postOrder:
			return  .POST
		case .getOrder:
			return .GET
		}
	}
}
