//
//  DownloadedMenuItem.swift
//  MCRAvocado
//
//  Created by Onie on 07.10.2022.
//

import Foundation

struct DownloadedMenuItems: Codable{
	let totalmenu: Int
	let result: [DMenuItem]

	private enum CodingKeys : String, CodingKey {
		case totalmenu = "Total Menu"
		case result = "Result"
	}
}

struct DMenuItem:Codable {
	let images: [String]
	let menuname: String
	let description: String
}

extension DMenuItem: Identifiable {
	var id: some Hashable { self.menuname }
}
