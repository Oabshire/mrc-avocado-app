//
//  MenuGridView.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

struct MenuGridView: View {
	@State private var menu = menuDataSource

	var body: some View {
		NavigationView {
			ScrollView{
				LazyVGrid(columns: .init(repeating: .init(), count: 2)) {
					ForEach(menuDataSource.section) { section in
						MenuGridCell(text: section.name.rawValue)
						
					}
				}.padding()
			}
			.navigationBarTitle("Menu")
			.background(Color.mainBackgroundColor)
		}
	}
}

struct MenuGridView_Previews: PreviewProvider {
	static var previews: some View {
		MenuGridView()
	}
}
