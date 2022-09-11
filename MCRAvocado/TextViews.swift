//
//  TextViews.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct WelcomeText: View {
	var text: String
	var body: some View {
		Text(text)
			.bold()
			.font(.title)
			.kerning(3.5)
			.foregroundColor(Color.white)
	}
}

struct UserNameText: View {
	var text: String
	var body: some View {
		Text(text)
			.foregroundColor(Color.white)
			.kerning(2.0)
			.font(.title)
	}
}

struct OnboardingTitleText: View {
	var text: String
	var body: some View {
		Text(text)
			.bold()
			.foregroundColor(Color.onboardingAccentColor)
			.kerning(3.0)
			.font(.largeTitle)
	}
}

struct OnboardingLineText: View {
	let lineText: String
	var body: some View {
		Text(lineText)
			.fontWeight(.medium).frame(maxWidth: Constants.Onboarding.lineTextWidth, alignment: .leading)
			.font(.title3)
			.padding(.leading)
	}
}

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			VStack() {
				OnboardingTitleText(text: "Avocado")
				OnboardingLineText(lineText: "Some text")
				WelcomeText(text: TextLibrary.ViewTexts.welcomeText).background(.black)
				UserNameText(text: TextLibrary.ViewTexts.userNameText).background(.black)
			}
		}
	}
}
