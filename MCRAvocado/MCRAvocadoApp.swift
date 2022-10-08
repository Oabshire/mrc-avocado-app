//
//  MCRAvocadoApp.swift
//  MRCAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

@main
struct MCRAvocadoApp: App {
	@StateObject var order: Order = Order(orderedItems: [:])
	var body: some Scene {
		WindowGroup {
			StartView(factory: OrderListFactory()).environmentObject(order)
		}
	}
}
