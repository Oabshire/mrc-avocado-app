//
//  ButtonViews.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct RoundImageViewStrokedFilled: View {
	let systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.system(size: 57))
			.foregroundColor(Color.white)
			.frame(width: Constants.General.roundImageViewWidthHeight,
						 height: Constants.General.roundImageViewWidthHeight)
			.background(
				Circle().fill(Color.buttonColor))
	}
}

struct BottomButton: View {
	let text: String
	let color: Color
	let action: () -> Void
	var body: some View {
		Button(action: {
			action()
		}) {
			Text(text.uppercased()).fontWeight(.bold).font(.title3)
				.frame(maxWidth: Constants.Onboarding.buttonWidth)
		}
		.padding(Constants.Onboarding.buttonPadding)
		.background(
			ZStack {
				color
			}
		)
		.foregroundColor(Color.white)
		.cornerRadius(Constants.Onboarding.buttonCornerRadius)
	}
}

struct ButtonViews_Previews: PreviewProvider {
	static var previews: some View {
		RoundImageViewStrokedFilled(systemName:"questionmark.circle")
	}
}
