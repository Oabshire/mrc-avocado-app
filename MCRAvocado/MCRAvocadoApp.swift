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
	@State var selectedTab: Int = 1

	let persistenceController = PersistenceController.shared

	var body: some Scene {
		WindowGroup {
			ZStack {
				StartView(factory: CartListFactory(selectedTab: $selectedTab), selectedTab: $selectedTab)
					.environmentObject(order)
					.environment(\.managedObjectContext, persistenceController.container.viewContext)
				if launchScreenManager.state != .complete {
					MainLaunchScreenView()
				}
			}.environmentObject(launchScreenManager)
		}
	}
}
