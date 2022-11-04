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

struct LargeDescriptionText: View {
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
	let price: String
	var body: some View {
		HStack {
			Text(price)
				.kerning(2.0)
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

struct HeaderText: View {
	let text: String
	var body: some View {
		Text(text)
			.font(.title2)
			.bold()
			.frame(alignment: .center)
	}
}

struct HeaderLargeText: View {
	let text: String
	var body: some View {
		Text(text)
			.font(.title3)
			.fontWeight(.semibold)
		.frame(alignment: .center)	}
}

// MARK: - Preview
struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			VStack {
				DetailTitleText(lineText: "Detail Title Text")
				LargeDescriptionText(lineText: "Detail DescriptionText")
				DetailPriceText(price: "45")
				SectionHeader(text: "OATMEAL")
			}
		}
	}
}
