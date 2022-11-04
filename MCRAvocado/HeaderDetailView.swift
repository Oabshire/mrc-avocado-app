//
//  HeaderDetailView.swift
//  MCRAvocado
//
//  Created by Onie on 01.11.2022.
//

import SwiftUI

/// Header view for OrderDetailView
struct HeaderDetailView: View {

	/// Order that contains information to display
	let order: OrderContainer

	// MARK: - Body
	var body: some View {
		ZStack {
			if order.status == .completed {
				Color.onboardingAccentColor
					.ignoresSafeArea()
			} else {
				Color.accentColor
					.ignoresSafeArea()
			}
			LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear]),
										 startPoint: .top,
										 endPoint: .bottom)
			.frame(height: 150)
			.edgesIgnoringSafeArea(.all)
			VStack {
				HStack {
					HeaderLargeText(text: order.status == .completed ? "Completion time:" : "Estimated completion time: ")
						.foregroundColor(.defaultBackgroundColor)
					Spacer()
					HeaderLargeText(text: order.estimatedCompletionTime?.toMinutesHoursString ?? "")
						.foregroundColor(.defaultBackgroundColor)
				}
				.padding(.bottom, 5)
				.padding(.top, 5)
				HStack {
					HeaderText(text: "Total: ")
						.foregroundColor(.defaultBackgroundColor)
					Spacer()
					HeaderLargeText(text:String(order.totalAmount.toCurrencyString ?? ""))
						.foregroundColor(.defaultBackgroundColor)
				}
			}.padding()
		}
	}
}

// MARK: - Preview
struct InProgressView_Previews: PreviewProvider {
	static var previews: some View {
		HeaderDetailView(order: OrderContainer(id: UUID(),
																					 orderedItems: [],
																					 totalAmount: 10,
																					 dateOfCreation: Date(),
																					 estimatedCompletionTime: Date(),
																					 status: .completed))
	}
}
