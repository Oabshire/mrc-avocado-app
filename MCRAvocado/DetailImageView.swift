//
//  DetailImageView.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

import SwiftUI

struct DetailImageView: View {
	let menuItemPicture: URL?

	var body: some View {
		AsyncImage(url:menuItemPicture) { image in
			image
				.resizable()
				.scaledToFill()
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
