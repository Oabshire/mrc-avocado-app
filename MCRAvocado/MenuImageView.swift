//
//  MenuImageView.swift
//  MCRAvocado
//
//  Created by Onie on 14.10.2022.
//

import SwiftUI

struct MenuImage: View {
	let url: URL?

	var body: some View {
		AsyncImage(url:url) { image in
			image
				.resizable()
		} placeholder: {
			Image("onboardingAvocado")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.overlay {
					if url != nil {
						ProgressView()
							.frame(maxWidth: .infinity, maxHeight: .infinity)
							.background(.gray.opacity(0.4))
					}
				}
		}
		.frame(width: Constants.General.rowImageWidthHeight,
					 height: Constants.General.rowImageWidthHeight)
		.cornerRadius(Constants.General.rowImageCornerRadius)
	}
}
