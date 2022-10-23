//
//  ButtonViews.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct BottomButton: View {
	let text: String
	let color: Color
	let action: () -> Void
	var body: some View {
		Button {
			action()
		} label: {
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
		BottomButton(text: "My bottom button",
								 color: .accentColor) {}
	}
}
