//
//  MenuItemDetailView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

struct MenuItemDetailView: View {

	/// Mode for dismissing view when button "Add to Order" taped
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>

	@EnvironmentObject var order: Order
	@State var amountToAdd: Int = 1

	/// Source of data
	let menuItem: MenuItem

	var body: some View {
		VStack {
			DetailTitleText(lineText: menuItem.name)
			DetailDescriptionText(lineText: menuItem.description ?? "")

			HStack{
				DetailPriceText(lineText: "$ " + String((menuItem.price * Double(amountToAdd)).roundTwoAfterPoint))
					.frame(maxWidth: 125)
				Spacer()
				Stepper(value: $amountToAdd, in: 1...100) {
					DetailTitleText(lineText: String(amountToAdd))
				}.frame(maxWidth: 125)
			}
			Spacer()
			BottomButton(text: "Add to Order", color: .buttonColor) {
				if order.addMenuItem(item: menuItem, amount: amountToAdd) {
					order.printOrderedItemsNameAndAmount()
				}
				self.mode.wrappedValue.dismiss() // dismissing view
			}
		}.background(Color.white)
			.padding()
	}
}

struct MenuItemDetailView_Previews: PreviewProvider {

	static var previews: some View {
		let menuItem = MenuItem(name: "Blueberry pancakes",
														price: 11.99,
														isInStock: true,
														calories: 610,
														description: TextLibrary.MenuItemDescription.blueberryPancake,
														type: .pancakes,
														imageName: "blueberry_pancakes")

		MenuItemDetailView(menuItem: menuItem)
			.environmentObject(orderDataSource)

		MenuItemDetailView(menuItem: menuItem)
			.preferredColorScheme(.dark)
			.environmentObject(orderDataSource)
		
		MenuItemDetailView(menuItem: menuItem)
			.previewLayout(.fixed(width: 568, height: 320))
			.environmentObject(orderDataSource)

		MenuItemDetailView(menuItem: menuItem)
			.previewLayout(.fixed(width: 568, height: 320))
			.environmentObject(orderDataSource)
			.preferredColorScheme(.dark)
	}
}
