//
//  OnboardingView.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct OnbordingView: View {
	@Binding var isOnboardingIsShowing: Bool
	var body: some View {
		GeometryReader { geometry in
			ScrollView(showsIndicators: false) {
				VStack {
					OnboardingTitleText(text: TextLibrary.onboardingTitleText)
						.padding(.top)
					
					Image("onboardingAvocado")
						.resizable()
						.scaledToFit()
						.frame(width: Constants.General.imageWidhtHeight,
							   height: Constants.General.imageWidhtHeight)
						.padding()
					LineTextView(imageName: "menucard", lineText: TextLibrary.onboardingFirstText)
					LineTextView(imageName: "dollarsign.circle", lineText: TextLibrary.onboardingSecondText)
					LineTextView(imageName: "camera", lineText: TextLibrary.onboardingThirdText)
					Spacer()
					HitMeButton(isOnboardingIsShowing: $isOnboardingIsShowing).padding()
				}
				.frame(minHeight: geometry.size.height)
			}.frame(width: geometry.size.width)
		}
	}
}


struct LineTextView: View {
	let imageName: String
	let lineText: String
	var body: some View {
		HStack {
			OnboardingIconView(imageName: imageName)
			OnboardingLineText(lineText: lineText)
		}
		.padding(.leading)
		.padding(.trailing)
		
	}
}

struct HitMeButton: View {
	@Binding var isOnboardingIsShowing: Bool
	var body: some View {
		Button(action: {
			isOnboardingIsShowing = false
		}) {
			Text("Ok".uppercased()).fontWeight(.bold).font(.title3)
				.frame(maxWidth: Constants.Onboarding.buttonWidth)
		}
		.padding(Constants.Onboarding.buttonPadding)
		.background(
			ZStack {
				ColorLibrary.onboardingAccentColor
			}
		)
		.foregroundColor(Color.white)
		.cornerRadius(Constants.Onboarding.buttonCornerRadius)
	}
}

struct OnbordingView_Previews: PreviewProvider {
	
	static var previews: some View {
		OnbordingView(isOnboardingIsShowing: .constant(true))
		OnbordingView(isOnboardingIsShowing: .constant(true)).preferredColorScheme(.dark)
		OnbordingView(isOnboardingIsShowing: .constant(true)).previewLayout(.fixed(width: 568, height: 320))
		OnbordingView(isOnboardingIsShowing: .constant(true)).previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
