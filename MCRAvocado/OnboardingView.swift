//
//  OnboardingView.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct OnboardingView: View {
	@Binding var isOnboardingIsShowing: Bool
	var body: some View {
		GeometryReader { geometry in
			ScrollView(showsIndicators: false) {
				VStack {
					OnboardingTitleText(text: TextLibrary.ViewTexts.onboardingTitleText)
						.padding(.top)
					
					Image("onboardingAvocado")
						.resizable()
						.scaledToFit()
						.frame(width: Constants.General.imageWidthHeight,
									 height: Constants.General.imageWidthHeight)
						.padding()
					LineTextView(imageName: "menucard", lineText: TextLibrary.ViewTexts.onboardingFirstText)
					LineTextView(imageName: "dollarsign.circle", lineText: TextLibrary.ViewTexts.onboardingSecondText)
					LineTextView(imageName: "camera", lineText: TextLibrary.ViewTexts.onboardingThirdText)
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
		BottomButton(text: "Ok", color: Color.onboardingAccentColor) {
			isOnboardingIsShowing = false
		}
	}
}

struct OnboardingView_Previews: PreviewProvider {
	
	static var previews: some View {
		OnboardingView(isOnboardingIsShowing: .constant(true))
		OnboardingView(isOnboardingIsShowing: .constant(true)).preferredColorScheme(.dark)
		OnboardingView(isOnboardingIsShowing: .constant(true)).previewLayout(.fixed(width: 568, height: 320))
		OnboardingView(isOnboardingIsShowing: .constant(true)).previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
