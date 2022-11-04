//
//  EmptyCartView.swift
//  MCRAvocado
//
//  Created by Onie on 25.09.2022.
//

import SwiftUI

// View for empty cart
struct EmptyCartView: View {
	// MARK: - Body
	var body: some View {
		VStack {
			Image(systemName: "cart")
				.font(.system(size: 100))
			Text("Your Cart is empty")
				.font(.title3)
				.padding()
		}
		.foregroundColor(.onboardingAccentColor)
		.navigationTitle("Cart")
	}
}

// MARK: - Preview
struct EmptyCartView_Previews: PreviewProvider {
	static var previews: some View {
		EmptyCartView()
	}
}
