//
//  BottonViews.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct RoundImageViewStrokedFilled: View {
	var systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.system(size: 57))
			.foregroundColor(Color.white)
			.frame(width: Constants.General.roundImageViewWidthHeight,
				   height: Constants.General.roundImageViewWidthHeight)
			.background(
				Circle().fill(Color.buttonColor))
	}
}

struct BottonViews_Previews: PreviewProvider {
	static var previews: some View {
		RoundImageViewStrokedFilled(systemName:"questionmark.circle")
	}
}
