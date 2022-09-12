//
//  DetailView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

struct DetailView: View {
	@Binding var ammountToAdd: Int
	var menuItem: MenuItem
	var donePressed: (() -> Void)?

	var body: some View {
		VStack {
			DetailTitleText(lineText: menuItem.name).padding()
			DetailDescriptionText(lineText: menuItem.description ?? "")
				.padding(.trailing)
				.padding(.leading)

			HStack{
				DetailTitleText(lineText: "$ " + String((menuItem.price * Double(ammountToAdd)).roundTwoAfterPoint))
				Stepper(value: $ammountToAdd, in: 1...100) {
					DetailTitleText(lineText: String(ammountToAdd))
				}.padding(.trailing)
			}
			Spacer()
			BottomButton(text: "Add to Order", color: .buttonColor) {
				donePressed?()
			}
			.padding()
		}.background(Color.mainImageColor)
	}
}
