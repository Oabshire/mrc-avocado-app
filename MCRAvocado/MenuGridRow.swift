//
//  MenuGridRow.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

/// View for Discount Grid
struct MenuGridRow: View {

	/// Discount to display
	let discount: Discount

	var body: some View {
		ZStack {
			Rectangle()
				.aspectRatio(1.0, contentMode: .fit)
				.overlay(
					Image(discount.rawValue)
						.resizable()
						.scaledToFit()
				)
				.overlay(Color.black.opacity(0.5))
				.cornerRadius(30)
				.shadow(color: .gray, radius: 2, x: 2, y: 2)
			Text(discount.rawValue)
				.foregroundColor(.white.opacity(0.8))
				.font(.title2)
				.bold()
				.padding()
		}
		.overlay(Text(String(discount.percentageValue) + "%")
			.font(.title3)
			.fontWeight(.bold)
			.foregroundColor(.white)
			.padding(.horizontal, 10)
			.padding(.vertical, 4)
			.background(.red)
			.clipShape( Capsule() )
			.padding()
						 , alignment: .bottomTrailing)
	}
}

struct MenuGridCell_Previews: PreviewProvider {
	static var previews: some View {
		let discount: Discount = .nationalIndependenceDay
		MenuGridRow(discount: discount)
		MenuGridRow(discount: discount)
			.preferredColorScheme(.dark)
		MenuGridRow(discount: discount)
			.previewLayout(.fixed(width: 568, height: 320))
		MenuGridRow(discount: discount)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
