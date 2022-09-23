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
			DetailTitleText(lineText: menuItem.name).padding()
			DetailDescriptionText(lineText: menuItem.description ?? "")
				.padding(.trailing)
				.padding(.leading)
			
			HStack{
				DetailTitleText(lineText: "$ " + String((menuItem.price * Double(amountToAdd)).roundTwoAfterPoint))
					.frame(maxWidth: 200)
				Spacer()
				Stepper(value: $amountToAdd, in: 1...100) {
					DetailTitleText(lineText: String(amountToAdd))
				}.frame(maxWidth: 125).padding(.trailing)
			}
			Spacer()
			BottomButton(text: "Add to Order", color: .buttonColor) {
				if order.addMenuItem(item: menuItem, amount: amountToAdd) {
					order.printOrderedItemsNameAndAmount()
				}
				self.mode.wrappedValue.dismiss() // dismissing view
			}
			.padding()
		}.background(Color.white)
	}
}
