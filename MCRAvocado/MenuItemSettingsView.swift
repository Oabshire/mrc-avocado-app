//
//  MenuItemSettingsView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// View with settings for MenuDetail View
struct MenuItemSettingsView: View {

	/// Mode for dismissing view when button "Add to Order" taped
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>
	/// Order to which menu items are added
	@EnvironmentObject var order: Order

	@State var amountToAdd: Int = 1
	@State var selectedMilkType = 0
	@State var selectedCupSize = 1
	@State var withIce = false

	let milkTypes: [MilkType] = [ .whole, .nonFat, .soy, .almond, .coconut, .oatMilk, .heavyCream]
	let cupSizes: [CupSize] = [ .tall, .grande, .venti]

	/// Is Item is a drink
	var isDrink: Bool {
		return menuItem.type == .hotDrinks || menuItem.type == .coldDrinks
	}

	/// Source of data
	let menuItem: MenuItemContainer
	/// MenuItem builder
	var builder: MenuItemToAddBuilder = MenuItemToAddBuilder()

	var body: some View {
		VStack(alignment: .leading) {
			DetailTitleText(lineText: menuItem.name)
				.padding(.bottom, 5)
			if isDrink {
				HStack {
					Text("Size of cup")
					Spacer()
					Picker(selection: $selectedCupSize, label: Text("size of cup")) {
						ForEach(0 ..< cupSizes.count, id: \.self) {index in
							Text(self.cupSizes[index].rawValue).tag(index)
						}
					}.accentColor(.onboardingAccentColor)
				}
				if menuItem.type == .hotDrinks {
					HStack {
						Text("Type of milk")
						Spacer()
						Picker(selection: $selectedMilkType, label: Text("Type of Milk")) {
							ForEach(0 ..< milkTypes.count, id: \.self) {index in
								Text(self.milkTypes[index].rawValue).tag(index)
							}
						}.accentColor(.onboardingAccentColor)
					}
				} else {
					HStack {
						Text("With ice")
						Spacer()
						Toggle(isOn: $withIce) {}
							.tint(Color.onboardingAccentColor)
					}
				}
			} else {
				LargeDescriptionText(lineText: menuItem.description ?? "")
			}
			HStack {
				DetailPriceText(price: (menuItem.price * Double(amountToAdd)).toCurrencyString ?? "")
					.frame(alignment: .leading)
				Spacer()
				AvocadoStepper(value: $amountToAdd, in:  1...99)
			}

			Spacer()
			BottomButton(text: "Add to Order", color: .buttonColor) {
				builder.cupSize = cupSizes[selectedCupSize]
				builder.milkType = milkTypes[selectedMilkType]
				builder.iced = withIce
				builder.price = menuItem.price

				let itemToAdd = builder.buildMenuItem(from: menuItem)
				_ = order.addMenuItem(item: itemToAdd, amount: amountToAdd)
				self.mode.wrappedValue.dismiss() // dismissing view
			}
		}
		.padding()
		.background(Color.defaultBackgroundColor)
	}
}

// MARK: - Preview
struct MenuItemDetailView_Previews: PreviewProvider {
	static var previews: some View {
		let menuItem = MenuItemContainer(id: UUID(),
																		 name: "Blueberry pancakes",
																		 price: 11.99,
																		 isInStock: true,
																		 calories: 610,
																		 description: "Some description",
																		 type: .coldDrinks,
																		 imageUrl: nil,
																		 withIce: nil,
																		 typeOfMilk: nil,
																		 cupSize: nil)

		MenuItemSettingsView(menuItem: menuItem)
			.environmentObject(orderDataSource)
		MenuItemSettingsView(menuItem: menuItem)
			.preferredColorScheme(.dark)
			.environmentObject(orderDataSource)
		MenuItemSettingsView(menuItem: menuItem)
			.previewLayout(.fixed(width: 568, height: 320))
			.environmentObject(orderDataSource)
		MenuItemSettingsView(menuItem: menuItem)
			.previewLayout(.fixed(width: 568, height: 320))
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
	}
}
