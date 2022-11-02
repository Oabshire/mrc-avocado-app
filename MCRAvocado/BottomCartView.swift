//
//  BottomCartView.swift
//  MCRAvocado
//
//  Created by Onie on 02.11.2022.
//

import SwiftUI

struct BottomCartView: View {
	@EnvironmentObject var order: Order
	@Binding var isOrderConfShows: Bool
	@Binding var selectedTab: Int
	var buttonAction: () async -> Void
	var body: some View {

		VStack {
			HStack {
				HeaderText(text: "Total: ")
				Spacer()
				HeaderLargeText(text:String(order.discountedAmount.roundTwoAfterPoint ?? ""))
			}
			.frame(maxWidth: Constants.Onboarding.buttonWidth)
			BottomButton(text: "Place order", color: .onboardingAccentColor) {
				isOrderConfShows = true
				Task {
					await buttonAction()
				}
			}
			.fullScreenCover(isPresented: $isOrderConfShows) {
				OrderConfirmationView(isOrderPlaced: $isOrderConfShows, selectedTab: $selectedTab).environmentObject(order)
			}
		}

		.padding(Constants.Onboarding.buttonPadding)
		.background(.thickMaterial)
	}
}

struct BottomCartView_Previews: PreviewProvider {
	static var previews: some View {
		BottomCartView(isOrderConfShows: .constant(false),
									 selectedTab: .constant(2),
									 buttonAction: {})
		.environmentObject(orderDataSource)
	}
}
