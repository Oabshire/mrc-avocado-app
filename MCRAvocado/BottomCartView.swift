//
//  BottomCartView.swift
//  MCRAvocado
//
//  Created by Onie on 02.11.2022.
//

import SwiftUI

/// Bottom View for CartListView
struct BottomCartView: View {

	/// Order that contains ordered items and discounts
	@EnvironmentObject var order: Order
	/// Is Order confirmation view shows
	@Binding var isOrderConfShows: Bool
	/// Selected tabs
	@Binding var selectedTab: Int
	/// Available discounts
	@State var discounts: [Discount] = [.none]
	/// Selected Discount
	@State var selectedDiscount: Int = 0
	/// "Place order" button Action
	var buttonAction: () async -> Void

	// MARK: - Body
	var body: some View {
		VStack {
			HStack {
				Text("Subtotal: ")
				Spacer()
				Text(String(order.amountWithoutDiscount.toCurrencyString ?? ""))
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
				HeaderLargeText(text:String(order.discountedAmount.toCurrencyString ?? ""))
					.padding(.trailing)
			}
			BottomButton(text: "Place order", color: .onboardingAccentColor) {
				isOrderConfShows = true
				Task {
					await buttonAction()
				}
			}
			.fullScreenCover(isPresented: $isOrderConfShows) {
				OrderConfirmationView(selectedTab: $selectedTab,
															isOrderPlaced: $isOrderConfShows)
				.environmentObject(order)
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

// MARK: - Private
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

// MARK: - Preview
struct BottomCartView_Previews: PreviewProvider {
	static var previews: some View {
		BottomCartView(isOrderConfShows: .constant(false),
									 selectedTab: .constant(2),
									 buttonAction: {})
		.environmentObject(orderDataSource)
	}
}
