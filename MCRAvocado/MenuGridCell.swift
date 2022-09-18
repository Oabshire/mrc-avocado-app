//
//  MenuGridCell.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

struct MenuGridCell: View {
	var text: String
	var body: some View {
		Rectangle()
			.aspectRatio(1.0, contentMode: .fit)
			.overlay(
				Image(text)
					.resizable()
					.scaledToFit()
			)
			.overlay(Color.black.opacity(0.5))
			.overlay(
				Text(text)
					.foregroundColor(.white.opacity(0.8))
					.font(.title)
					.bold()
					.padding()
			)
			.cornerRadius(30)
			.overlay(
				RoundedRectangle(cornerRadius:30.0).strokeBorder((.white), lineWidth: 5))
	}
}

struct MenuGridCell_Previews: PreviewProvider {
	static var previews: some View {
		MenuGridCell(text: "Hot Drinks")
	}
}
