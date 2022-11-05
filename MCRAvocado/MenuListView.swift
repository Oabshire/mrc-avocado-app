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
	/// viewContext for working with CoreData
	@Environment(\.managedObjectContext) var viewContext
	/// Order that contains ordered items and discounts
	@EnvironmentObject var order: Order
	/// NetworkReachability to check network connection
	@EnvironmentObject var network: NetworkReachability
	/// Is menu updation needed
	@State var needUpdateMenu = true
	/// Is menu Loading
	@Binding var isLoading: Bool
	/// Index of choosen filter
	@Binding var activeFilterIndex: Int
	/// Prdedicates for filtering menu
	let predicatesTypes = predicatesDataSource
	/// Menu Sections with items
	@FetchRequest var menuSections: FetchedResults<SectionEntity>
	@State private var refreshedID = UUID()

	init(isLoading: Binding<Bool>, activeFilterIndex: Binding<Int>, fetchRequest: FetchRequest<SectionEntity>) {
		self._isLoading = isLoading
		self._activeFilterIndex = activeFilterIndex
		self._menuSections = fetchRequest
	}

	var body: some View {
		NavigationView {
			List {
				ForEach(menuSections.sorted(), id: \.name) { section in
					Section(content: {
						ForEach(section.menuItems ?? [] ,id: \.name) { item in
							if item.isInStock == true {
								let itemContainer = ItemEntityAdapter.createItemContainer(from: item)
								NavigationLink(
									destination: MenuItemDetailView(order: _order, menuItem:itemContainer)) {
										MenuRowView(menuItem: itemContainer).padding(.top)
											.id(refreshedID)
									}
							}
						}
					}, header: {
						SectionHeader(text: section.name)
					})
				}
				.listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
			}
			.listStyle(.grouped)
			.navigationTitle("Menu")
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
						.font(.title2)
				})
			}
		}
		.onChange(of: network.isConnected) { _ in
			if network.isConnected {
				refreshedID = UUID()
				Task {
					await fetchMenu()
				}
			}
		}
		.task {
			await fetchMenu()
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

// MARK: - Private
private extension MenuListView {

	/// Gets menu  from api, saves to coreData, fetchs menu from CoreData
	func fetchMenu() async {
		guard needUpdateMenu  else { return }
		let  dataManager = DataManager()
		do {
			let menuContainer: [MenuSectionContainer] = try await dataManager.getMenu()
			if !menuContainer.isEmpty {
				for section in menuSections {
					do {
						try PersistenceController.deleteSection(section: section, in: self.viewContext)
					} catch {
						print(error.localizedDescription)
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
		} catch {
			print(error.localizedDescription)
		}
	}

	/// Set isLoading to false (Dismis loading View)
	@MainActor
	func stopLoading() async {
		isLoading = false
		needUpdateMenu = false
	}
}

// MARK: - Preview
struct MenuListView_Previews: PreviewProvider {
	static var previews: some View {
		let context = PersistenceController.preview.container.viewContext
		let section = SectionEntity(context: context)
		section.name = "New Section"
		return MenuListView(isLoading: .constant(false),
												activeFilterIndex: .constant(0),
												fetchRequest: FetchRequest(
													entity: SectionEntity.entity(),
													sortDescriptors: [],
													predicate: predicatesDataSource[0].predicate))
		.environment(\.managedObjectContext, context)
	}
}
