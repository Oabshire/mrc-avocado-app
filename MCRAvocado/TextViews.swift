//
//  TextViews.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct WelcomeText: View {
	let text: String
	var body: some View {
		Text(text)
			.bold()
			.font(.title)
			.kerning(3.5)
			.foregroundColor(Color.white)
	}
}

struct UserNameText: View {
	let text: String
	var body: some View {
		Text(text)
			.foregroundColor(Color.white)
			.kerning(2.0)
			.font(.title)
	}
}

struct OnboardingTitleText: View {
	let text: String
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

struct DetailTitleText: View {
	let lineText: String
	var body: some View {
		Text(lineText)
			.foregroundColor(.black)
			.kerning(3.0)
			.font(.title2)
			.fontWeight(.medium).frame(maxWidth: Constants.Onboarding.lineTextWidth, alignment: .center)
	}
}

struct KcalText: View {
	let lineText: String
	var body: some View {
		Text(lineText)
			.foregroundColor(.black)
			.font(.body)
			.fontWeight(.medium).frame(maxWidth: Constants.Onboarding.lineTextWidth, alignment: .center)
	}
}

struct DetailDescriptionText: View {
	let lineText: String
	var body: some View {
		Text(lineText)
			.foregroundColor(.black)
			.kerning(1.5)
			.font(.title3)
			.fontWeight(.medium)
			.frame(maxWidth: Constants.Onboarding.lineTextWidth, alignment: .center)
	}
}

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			VStack() {
				OnboardingTitleText(text: "Avocado")
				OnboardingLineText(lineText: "Some text")
				WelcomeText(text: TextLibrary.AppTexts.welcomeText).background(.black)
				UserNameText(text: TextLibrary.AppTexts.userNameText).background(.black)
				DetailTitleText(lineText: "Pancake")
				DetailDescriptionText(lineText: "some long text some long text")
				KcalText(lineText: "$15,99")
			}
		}
	}
}
