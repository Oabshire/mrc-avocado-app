//
//  MenuRequestMock.swift
//  MCRAvocadoTests
//
//  Created by Onie on 22.10.2022.
//

import Foundation
@testable import Avocado

enum MenuRequestMock: RequestProtocol {
	case getMenu
	// 1
	var requestType: RequestType {
		return .GET
	}
	// 2
	var path: String {
		guard let path = Bundle.main.path(forResource: "MenuMock", ofType: "json")
		else { return "" }
		return path
	}
}
