//
//  DetailView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

struct DetailView: View {
	@Binding var amountToAdd: Int

	/// Source of data
	var menuItem: MenuItem
	
	/// Action for bottom button
	var donePressed: (() -> Void)?

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
				donePressed?()
			}
			.padding()
		}.background(Color.mainImageColor)
	}
}
