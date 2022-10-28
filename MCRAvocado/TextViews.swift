//
//  TextViews.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct DetailTitleText: View {
	let lineText: String
	var body: some View {
		Text(lineText)
			.kerning(3.0)
			.font(.title2)
			.fontWeight(.medium)
			.frame(maxWidth: Constants.Onboarding.lineTextWidth, alignment: .center)
	}
}

struct DetailDescriptionText: View {
	let lineText: String
	var body: some View {
		Text(lineText)
			.kerning(1.5)
			.font(.title3)
			.fontWeight(.medium)
			.frame(alignment: .leading)
	}
}

struct DetailPriceText: View {
	let symbol: String
	let price: String
	var body: some View {
		HStack {
			Text(symbol)
				.foregroundColor(.onboardingAccentColor)
				.kerning(3.0)
				.font(.title2)
				.fontWeight(.medium)
			Text(price)
				.kerning(3.0)
				.font(.title2)
				.fontWeight(.medium)
		}
	}
}

struct SectionHeader: View {
	let text: String
	var body: some View {
		Text(text)
			.font(.headline)
			.padding(5)
			.foregroundColor(.onboardingAccentColor)
	}
}

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			VStack {
				DetailTitleText(lineText: "Detail Title Text")
				DetailDescriptionText(lineText: "Detail DescriptionText")
				DetailPriceText(symbol: "$", price: "45")
				SectionHeader(text: "OATMEAL")
			}
		}
	}
}
