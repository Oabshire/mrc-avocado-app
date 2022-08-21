//
//  OnboardingView.swift
//  MRCAvocado
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
					OnboardingTitleText(text: StringLibrary.onboardingTitleText)
						.padding(.top)
					
					Image("onboardingAvocado")
						.resizable()
						.scaledToFit()
						.frame(width: 200, height: 200)
						.padding()
					LineTextView(imageName: "menucard", lineText: StringLibrary.onboardingFirstText)
					LineTextView(imageName: "dollarsign.circle", lineText: StringLibrary.onboardingSecondText)
					LineTextView(imageName: "camera", lineText: StringLibrary.onboardingThirdText)
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
				.frame(maxWidth: 568)
		}
		.padding(20.0)
		.background(
			ZStack {
				ColorLibrary.onboardingAccentColor
			}
		)
		.foregroundColor(Color.white)
		.cornerRadius(21)
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
