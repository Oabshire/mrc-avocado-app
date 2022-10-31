//
//  EmptyOrdersView.swift
//  MCRAvocado
//
//  Created by Onie on 31.10.2022.
//

import SwiftUI

struct EmptyOrdersView: View {

	var body: some View {
		VStack {
			Image(systemName: "clock")
				.font(.system(size: 100))
			Text("Order list is empty")
				.font(.title3)
				.padding()
		}
		.foregroundColor(.onboardingAccentColor)
	}
}

struct EmptyOrdersView_Previews: PreviewProvider {
	static var previews: some View {
		EmptyOrdersView()
	}
}
