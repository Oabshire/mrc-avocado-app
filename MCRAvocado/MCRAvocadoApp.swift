//
//  MCRAvocadoApp.swift
//  MRCAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

@main
struct MCRAvocadoApp: App {

	/// Order that contains ordered items and discounts
	@StateObject var order = Order(orderedItems: [:])

	/// Manager of lunch screen to control AnimationView
	@StateObject var launchScreenManager = LaunchScreenManager()

	/// NetworkReachability to check network connection
	@StateObject var networkReachability = NetworkReachability()

	/// Selected tab of tabBar
	@State var selectedTab: Int = 1

	/// Show ErrorConnection
	@State var isErrorPresented = false

	let persistenceController = PersistenceController.shared

	var body: some Scene {
		WindowGroup {
			ZStack {
				StartView(selectedTab: $selectedTab, factory: CartListFactory(selectedTab: $selectedTab))
					.environmentObject(order)
					.environmentObject(networkReachability)
					.environment(\.managedObjectContext, persistenceController.container.viewContext)
				if launchScreenManager.state != .complete {
					MainLaunchScreenView()
				}
			}.environmentObject(launchScreenManager)
				.onChange(of: networkReachability.isConnected) { _ in
					isErrorPresented = !networkReachability.isConnected
				}
				.overlay(
					ICErrorView(isPresented: $isErrorPresented )
					, alignment: .top
				)
		}
	}
}
