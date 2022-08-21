//
//  BottonViews.swift
//  MRCAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct RoundImageViewSrokedFilled: View {
	var systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.largeTitle)
			.foregroundColor(Color.white)
			.frame(width: 56, height: 56)
			.background(
				Circle().fill(ColorLibrary.buttonColor))
			.overlay(
				Circle().strokeBorder((ColorLibrary.mainImageColor), lineWidth: 2.0))
		
	}
}

struct BottonViews_Previews: PreviewProvider {
	static var previews: some View {
		RoundImageViewSrokedFilled(systemName:"questionmark")
	}
}
