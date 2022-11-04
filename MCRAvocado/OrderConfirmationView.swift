//
//  OrderConfirmationView.swift
//  MCRAvocado
//
//  Created by Onie on 29.10.2022.
//

import SwiftUI

struct OrderConfirmationView: View {
	/// Order that contains ordered items and discounts
	@EnvironmentObject var order: Order
	/// Selected tab of tabBar
	@Binding var selectedTab: Int
	/// is Order Places
	@Binding var isOrderPlaced: Bool

	// MARK: - Body
	var body: some View {
		ZStack {
			VStack {
				Image(systemName: "takeoutbag.and.cup.and.straw")
					.font(.system(size: 100))
					.foregroundColor(.onboardingAccentColor)
				Text("Order Successful")
					.font(.title)
					.fontWeight(.semibold)
					.padding()
				Text("Thank you!")
					.font(.title)
					.bold()
					.padding(5)
				Text("On my  way to your table")
					.font(.title2)
			}

			VStack {
				Spacer()
				BottomButton(text: "Go to menu", color: .onboardingAccentColor) {
					isOrderPlaced = false
					selectedTab = 1
				}.padding()
			}
		}
		.onChange(of: isOrderPlaced) { newValue in
			if !newValue {
				order.clearOrder()
			}
		}
	}
}

// MARK: - Preview
struct OrderConfirmationView_Previews: PreviewProvider {
	static var previews: some View {
		OrderConfirmationView(selectedTab: .constant(2),
													isOrderPlaced: .constant(false))
	}
}
