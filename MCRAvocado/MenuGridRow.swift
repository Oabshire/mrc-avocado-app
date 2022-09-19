//
//  MenuGridRow.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

struct MenuGridRow: View {
	var text: String
	var body: some View {
		ZStack {
			Rectangle()
				.aspectRatio(1.0, contentMode: .fit)
				.overlay(
					Image(text)
						.resizable()
						.scaledToFit()
				)
				.overlay(Color.black.opacity(0.5))
				.cornerRadius(30)
				.shadow(color: .gray, radius: 5, x: 2, y: 2)
			Text(text)
				.foregroundColor(.white.opacity(0.8))
				.font(.title2)
				.bold()
				.padding()
		}
	}
}

struct MenuGridCell_Previews: PreviewProvider {
	static var previews: some View {
		MenuGridRow(text: "Hot Drinks")
	}
}
