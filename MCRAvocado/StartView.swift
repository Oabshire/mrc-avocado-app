//
//  StartView.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

struct StartView: View {
	@AppStorage("FlightStatusCurrentTab") var selectedTab = 1

	var body: some View {
		TabView(selection: $selectedTab) {
			Text("Hello, World 0!")
				.tabItem {
					Image(systemName: "menucard")
						.resizable()
					Text("Menu")
				}
				.tag(0)

			Text("Hello, World! 1")
				.tabItem {
					Image(systemName: "percent")
						.resizable()
					Text("Discounts")
				}
				.tag(1)


			Text("Hello, World!2")
				.tabItem {
					Image(systemName: "house")
						.resizable()
					Text("Home")
				}
				.tag(2)
		}
	}
}

struct StartView_Previews: PreviewProvider {
	static var previews: some View {
		StartView()
	}
}
