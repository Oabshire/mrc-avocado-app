//
//  EmptyCartView.swift
//  MCRAvocado
//
//  Created by Onie on 25.09.2022.
//

import SwiftUI

struct EmptyCartView: View {
	var body: some View {
		VStack {
			Image(systemName: "cart")
				.font(.system(size: 100))
			Text("Your Cart is empty")
				.font(.title3)
				.padding()
		}.foregroundColor(.onboardingAccentColor)
			.navigationBarTitle("Cart")
	}
}

struct EmptyCartView_Previews: PreviewProvider {
	static var previews: some View {
		EmptyCartView()
	}
}
