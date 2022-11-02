//
//  HeaderDetailView.swift
//  MCRAvocado
//
//  Created by Onie on 01.11.2022.
//

import SwiftUI

struct HeaderDetailView: View {
	let order: OrderContainer
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
					Text(order.status == .completed ? "Completion time:" : "Estimated completion time: ")
						.font(.title3)
						.bold()
						.foregroundColor(.defaultBackgroundColor)
						.listSectionSeparator(.hidden)
					Spacer()
					Text(order.estimatedCompletionTime?.toMinutesHoursString ?? "")
						.font(.title3)
						.fontWeight(.semibold)
						.foregroundColor(.defaultBackgroundColor)
						.listSectionSeparator(.hidden)
				}
				.padding(.bottom, 5)
				.padding(.top, 5)
				HStack {
					Text("Total: ")
						.font(.title2)
						.bold()
						.foregroundColor(.defaultBackgroundColor)
						.frame(alignment: .center)
						.listSectionSeparator(.hidden)
					Spacer()
					Text(String(order.totalAmount.roundTwoAfterPoint ?? ""))
						.font(.title3)
						.fontWeight(.semibold)
						.foregroundColor(.defaultBackgroundColor)
						.frame(alignment: .center)
						.listSectionSeparator(.hidden)
				}
			}.padding()
		}
	}
}
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
