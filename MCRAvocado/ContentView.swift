//
//  ContentView.swift
//  MRCAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		ZStack {
			ColorLibrary.mainBackgroundColor
				.edgesIgnoringSafeArea(.all)
			LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.2), Color.clear]),
						   startPoint: .top,
						   endPoint: .bottom).edgesIgnoringSafeArea(.all)
			ZStack {
				MainImageView(systemName: "avocado")
				VStack {
					HeaderView()
				}
			}
		}
	}
}


struct HeaderView: View {
	var body: some View {
		HStack {
			VStack {
				WelcomeText(text: StringLibrary.welcomeText)
				UserNameText(text: StringLibrary.userNameText)
			}
			Spacer()
			Button(action: {
			}) {
				RoundImageViewSrokedFilled(systemName: "questionmark")
				
			}
		}.padding()
		Spacer()
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
