//
//  MCRAvocadoApp.swift
//  MRCAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

@main
struct MCRAvocadoApp: App {
	@StateObject var order = Order(orderedItems: [:])
	@StateObject var launchScreenManager = LaunchScreenManager()
	var body: some Scene {
		WindowGroup {
			ZStack {
			StartView(factory: OrderListFactory()).environmentObject(order)
				if launchScreenManager.state != .complete{
				MainLaunchScreenView()
				}
			}.environmentObject(launchScreenManager)
		}
	}
}
