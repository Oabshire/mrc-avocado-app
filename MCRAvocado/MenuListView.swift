//
//  MenuListView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI
import Foundation

/// List of menu items divided into section
struct MenuListView: View {

	/// Order to which menu items are added
	@EnvironmentObject var order: Order
	private var downloader = MenuLoader()

	/// Menu
	let dataSource: MenuModel

	init(dataSource: MenuModel) {
		self.dataSource = dataSource
		UITableView.appearance().backgroundColor = UIColor.mainBackgroundColor
	}

	var body: some View {
		NavigationView {
			List {
				ForEach(dataSource.section, id: \.hashValue) { section in
					Section(
						header: Text(section.name.rawValue)
					) {
						ForEach(section.menuItems) { item in
							if item.isInStock == true {
								NavigationLink(
									destination: MenuDetailView(order: _order, menuItem: item)) {
										MenuRowView(menuItem: item).padding(.top)
									}
							}
						}
					}
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationBarTitle("Menu")
		}
		.navigationViewStyle(StackNavigationViewStyle())
		.onAppear(perform: {
			Task {
				await downloadMenu()
			}
		})
	}
}

private extension MenuListView {
	func downloadMenu() async {
		do {
			_ = try await downloader.download(menuAt: "http://foodbukka.herokuapp.com/api/v1/menu")
		} catch let error{
			print("ERROR: \(error.localizedDescription)")
		}
	}
}

struct MenuListView_Previews: PreviewProvider {
	static var previews: some View {
		MenuListView(dataSource: menuDataSource)
			.environmentObject(orderDataSource)
		MenuListView(dataSource: menuDataSource)
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		MenuListView(dataSource: menuDataSource)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		MenuListView(dataSource: menuDataSource)
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
