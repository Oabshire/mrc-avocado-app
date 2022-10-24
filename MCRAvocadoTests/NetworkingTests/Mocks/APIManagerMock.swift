//
//  APIManagerMock.swift
//  MCRAvocadoTests
//
//  Created by Onie on 22.10.2022.
//

@testable import Avocado
import Foundation

struct APIManagerMock: APIManagerProtocol {
	func perform(_ request: RequestProtocol) async throws -> Data {
		return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
	}
}
