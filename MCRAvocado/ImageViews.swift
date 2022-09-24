//
//  ImageViews.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct MainImageView: View {
	let systemName: String
	var body: some View {
		Image(systemName)
			.font(.system(size: 250))
			.foregroundColor(Color.mainImageColor)
			.frame(width: Constants.General.imageWidthHeight,
						 height: Constants.General.imageWidthHeight)
	}
}

struct OnboardingIconView: View {
	let imageName: String
	var body: some View {
		Image(systemName: imageName).font(.title)
			.foregroundColor(Color.onboardingAccentColor)
			.frame(width: 30, height: 30)
	}
}

struct ImageViews_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color("MainBackgroundColor").edgesIgnoringSafeArea(.all)
			MainImageView(systemName: "avocado")
			
		}
		ZStack {
			Color("MainBackgroundColor").edgesIgnoringSafeArea(.all)
			MainImageView(systemName: "avocado").preferredColorScheme(.dark)
			
		}
	}
}
