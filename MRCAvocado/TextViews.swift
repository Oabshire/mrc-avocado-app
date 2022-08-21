//
//  TextViews.swift
//  MRCAvocado
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

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			VStack() {
				WelcomeText(text: StringLibrary.welcomeText)
				UserNameText(text: StringLibrary.userNameText)
			}
		}
	}
}
