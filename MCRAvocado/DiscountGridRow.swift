//
//  DiscountGridRow.swift
//  MCRAvocado
//
//  Created by Onie on 17.09.2022.
//

import SwiftUI

/// View for Discount Grid
struct DiscountGridRow: View {

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
				.overlay(
					LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), .clear]),
												 startPoint: .topLeading,
												 endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
				)
				.cornerRadius(30)
			Text(discount.rawValue)
				.foregroundColor(.white.opacity(0.9))
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
			.background(Color.onboardingAccentColor)
			.clipShape( Capsule() )
			.padding()
						 , alignment: .bottomTrailing)
	}
}

struct DiscountGridRow_Previews: PreviewProvider {
	static var previews: some View {
		let discount: Discount = .nationalIndependenceDay
		DiscountGridRow(discount: discount)
		DiscountGridRow(discount: discount)
			.preferredColorScheme(.dark)
		DiscountGridRow(discount: discount)
			.previewLayout(.fixed(width: 568, height: 320))
		DiscountGridRow(discount: discount)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
