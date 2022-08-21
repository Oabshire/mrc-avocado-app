//
//  ImageViews.swift
//  MRCAvocado
//
//  Created by Onie on 20.08.2022.
//

import SwiftUI

struct MainImageView: View {
	var systemName: String
	var body: some View {
		Image(systemName)
			.font(.system(size: 250))
			.foregroundColor(ColorLibrary.mainImageColor)
			.frame(width: 200, height: 200)
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
