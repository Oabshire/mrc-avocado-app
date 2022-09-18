//
//  StartView.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

struct StartView: View {
	@AppStorage("FlightStatusCurrentTab") var selectedTab = 1
	@State var menuIsShowing = true

	init() {
		let opaqueAppearence = UITabBarAppearance()
		opaqueAppearence.configureWithOpaqueBackground()
		UITabBar.appearance().scrollEdgeAppearance = opaqueAppearence
	}

	var body: some View {
		TabView(selection: $selectedTab) {
			MenuListView()
				.tabItem {
					Image(systemName: "menucard")
						.resizable()
					Text("Menu")
				}
				.badge("9")
				.tag(0)

			Text("Hello, World!2")
				.tabItem {
					Image(systemName: "house")
						.resizable()
					Text("Home")
				}
				.badge("8")
				.tag(1)


			Text("Hello, World!2")
				.tabItem {
					Image(systemName: "house")
						.resizable()
					Text("Home")
				}
				.badge("52")
				.tag(2)
		}
	}
}

struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		StartView()
	}
}
