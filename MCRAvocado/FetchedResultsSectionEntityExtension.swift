//
//  FetchedResultsSectionEntityExtension.swift
//  MCRAvocado
//
//  Created by Onie on 03.11.2022.
//

import SwiftUI

extension FetchedResults<SectionEntity> {
	func sorted() -> [SectionEntity] {
		self.sorted(by: { MenuItemType(rawValue: $0.name) ?? .other < MenuItemType(rawValue: $1.name) ?? .other })
	}
}
