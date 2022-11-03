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
	@State var discounts: [Discount] = [.none]
	@State var selectedDiscount: Int = 0
	var buttonAction: () async -> Void
	var body: some View {

		VStack {
			HStack {
				Text("Subtotal: ")
				Spacer()
				Text(String(order.amountWithoutDiscount.roundTwoAfterPoint ?? ""))
					.padding(.trailing)
			}
			HStack {
				Text("Type of Discount")
				Spacer()
				Picker(selection: $selectedDiscount, label: Text("Type of Discount")) {
					ForEach(0 ..< discounts.count, id: \.self) {index in
						Text(self.discounts[index].rawValue).tag(index)
					}
				}.accentColor(.onboardingAccentColor)
			}
			HStack {
				HeaderText(text: "Total: ")
				Spacer()
				HeaderLargeText(text:String(order.discountedAmount.roundTwoAfterPoint ?? ""))
					.padding(.trailing)
			}
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
		.onChange(of: selectedDiscount) { newValue in
			order.discount = discounts[newValue]
		}
		.task { await getCurrentDate() }
	}
}

private extension BottomCartView {
	func getCurrentDate() async {
		do {
			let dataManager = DataManager()
			let currentDate: Date = try await dataManager.getCurrentDate()
			await stopLoading(with: currentDate)
		} catch {
			print(error)
		}
	}

	@MainActor
	func stopLoading(with date: Date) async {
		discounts = Discount.getAvailableDiscounts(for: date)
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
