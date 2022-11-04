//
//  DetailImageView.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.`
//

import SwiftUI

/// Image for MenuItemDeteailView
struct DetailImageView: View {
	/// Image URL
	let menuItemPicture: URL?

	var body: some View {
		AsyncImage(url:menuItemPicture) { image in
			image
				.resizable()
				.aspectRatio(contentMode: .fill)
				.edgesIgnoringSafeArea(.all)
		} placeholder: {
			Image("onboardingAvocado")
				.resizable()
				.scaledToFill()
				.overlay {
					if menuItemPicture != nil {
						ProgressView()
							.frame(maxWidth: .infinity, maxHeight: .infinity)
							.background(.gray.opacity(0.4))
					}
				}
		}
	}
}
