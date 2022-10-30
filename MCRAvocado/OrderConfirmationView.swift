//
//  OrderConfirmationView.swift
//  MCRAvocado
//
//  Created by Onie on 29.10.2022.
//

import SwiftUI

struct OrderConfirmationView: View {
	@EnvironmentObject var order: Order
	@Binding var isOrderPlaced: Bool
	@Binding var selectedTab: Int

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

struct OrderConfirmationView_Previews: PreviewProvider {
	static var previews: some View {
		OrderConfirmationView(isOrderPlaced: .constant(false), selectedTab: .constant(2))
	}
}
