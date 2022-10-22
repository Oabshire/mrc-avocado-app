//
//  MenuListView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI
import Foundation
import CoreData

/// List of menu items divided into section
struct MenuListView: View {
	@Environment(\.managedObjectContext) var viewContext

	@EnvironmentObject var order: Order

	@State var activeFilterIndex = 0
	@Binding var isLoading: Bool

	@FetchRequest(sortDescriptors: [])
	var menuSections: FetchedResults<SectionEntity>

	private let saveDataManager = SaveDataManager()

	init(isLoading: Binding<Bool>) {
		self._isLoading = isLoading
		UITableView.appearance().backgroundColor = UIColor.mainBackgroundColor
	}

	let predicatesTypes = [
		(name: "ALL", predicate: nil),
		(name: "Waffles", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.waffles.rawValue)),
		(name: "Eggs Benedict", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.eggsBenedict.rawValue)),
		(name: "Oatmeal", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.oatmeal.rawValue)),
		(name: "Omelletes", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.omelletes.rawValue)),
		(name: "Bagels", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.bagel.rawValue)),
		(name: "Pancackes", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.pancakes.rawValue)),
		(name: "Desserts", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.dessert.rawValue)),
		(name: "Cold Drink", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.coldDrinks.rawValue)),
		(name: "Hot Drink", predicate: NSPredicate(format: "%K == %@", "name", MenuItemType.hotDrinks.rawValue))
	 ]

	var body: some View {
		NavigationView {
			List {
				ForEach(menuSections, id: \.name) { section in
					Section(section.name ?? "") {
						ForEach(section.menuItems ?? [] ,id: \.name) { item in
							if item.isInStock == true {
								let itemContainer = createItemContainer(from: item)
								NavigationLink(
									destination: MenuDetailView(order: _order, menuItem:itemContainer)) {
										MenuRowView(menuItem: itemContainer).padding(.top)
									}
							}
						}
					}
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationBarTitle("Menu")
			   .onChange(of: activeFilterIndex) { _ in
					 menuSections.nsPredicate = predicatesTypes[activeFilterIndex].predicate
			   }
			   .toolbar {
			    Menu(content: {
			     Picker(
			      selection: $activeFilterIndex,
			      content: {
			       ForEach(0..<predicatesTypes.count, id: \.self) { index in
			        let sortType = predicatesTypes[index]
			        Text(sortType.name)
			       }
			      },
			      label: {}
			     )
			    }, label: {
			     Image(systemName: "line.3.horizontal.decrease.circle.fill")
			    })
			   }
		}
		.navigationViewStyle(StackNavigationViewStyle())
		.task {
			await fetchMenu()
		}
	}
}

private extension MenuListView {
	func fetchMenu() async {
		let  dataManager = DataManager()
		let menuContainer: [MenuSectionContainer] = await dataManager.getMenu()
		saveDataManager.menu = menuContainer
		if !menuContainer.isEmpty {
			for section in menuSections {
				do {
					try PersistenceController.deleteSection(section: section)
				} catch {
					print("Error deleting list")
				}
			}
			for section in menuContainer {
				let sectionEntity = SectionEntity.create(withTitle: section.name , in: self.viewContext)
				for item in section.menuItems {
					ItemEntity.createWith(item: item,
																in: sectionEntity,
																using: self.viewContext)
				}
			}
		}
		await stopLoading()
	}

	@MainActor
	func stopLoading() async {
		isLoading = false
	}

	func createItemsArray(from entities: FetchedResults<ItemEntity>) -> [MenuItemContainer] {
		var resultArray: [MenuItemContainer] = []
		for item in entities {
			resultArray.append(createItemContainer(from: item))
		}
		print(resultArray)
		return resultArray
	}

	func 	createItemContainer (from entity: FetchedResults<ItemEntity>.Element ) -> MenuItemContainer {
		MenuItemContainer(menuId: entity.id,
											name: entity.name,
											price: entity.price,
											isInStock: entity.isInStock,
											calories: Int(entity.calories),
											description: entity.descript,
											type: MenuItemType(rawValue: entity.type) ?? .other,
											imageUrl: entity.imageUrl)
	}
}

struct MenuListView_Previews: PreviewProvider {
	static var previews: some View {
		MenuListView(isLoading: .constant(true))
			.environmentObject(orderDataSource)
		MenuListView(isLoading: .constant(true))
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
		MenuListView(isLoading: .constant(true))
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		MenuListView(isLoading: .constant(true))
			.environmentObject(orderDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
