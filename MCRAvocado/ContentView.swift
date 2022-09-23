//
//  ContentView.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct ContentView: View {
	@State private var menuIsShowing: Bool = false
	@State private var orderIsShowing: Bool = false
	var body: some View {
		ZStack {
			Color.mainBackgroundColor
				.edgesIgnoringSafeArea(.all)
			LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.2), Color.clear]),
										 startPoint: .top,
										 endPoint: .bottom).edgesIgnoringSafeArea(.all)
			ZStack {
				MainImageView(systemName: "avocado")
				VStack {
					HeaderView()
					Spacer()
				}
			}
		}
	}
}

struct HeaderView: View {
	@State private var onboardingIsShowing: Bool = false
	var body: some View {
		HStack {
			VStack {
				WelcomeText(text: TextLibrary.AppTexts.welcomeText)
				UserNameText(text: TextLibrary.AppTexts.userNameText)
			}
			Spacer()
			Button(action: {
				onboardingIsShowing = true
			}) {
				RoundImageViewStrokedFilled(systemName: "questionmark.circle")
				
			}.sheet(isPresented: $onboardingIsShowing, onDismiss: {} , content: {OnboardingView(onboardingIsShowing: $onboardingIsShowing)})
		}.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewInterfaceOrientation(.portraitUpsideDown)
		ContentView().preferredColorScheme(.dark)
		ContentView().previewLayout(.fixed(width: 568, height: 320))
		ContentView().previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
