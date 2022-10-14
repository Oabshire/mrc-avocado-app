//
//  DiscountGridView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

/// Grid of  discounts
struct DiscountGridView: View {
	@State var isActive = false

	/// discounts to display
	let discountsDataSource: [Discount]

	var body: some View {
		ZStack {
			NavigationView {
				ScrollView {
					LazyVGrid(columns: .init(repeating: .init(), count: 2)) {
						ForEach(discountsDataSource) { discount in
							MenuGridRow(discount: discount)
						}
					}.padding()
				}
				.navigationBarTitle("Discounts")
			}
			.navigationViewStyle(StackNavigationViewStyle())
			if !isActive {
				AdditionalLaunchScreenView()
			}
		}.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
				withAnimation {
					isActive.toggle()
				}
			}
		}
	}
}

struct DiscountGridView_Previews: PreviewProvider {
	static var previews: some View {
		DiscountGridView(discountsDataSource: discountDataSource)
		DiscountGridView(discountsDataSource: discountDataSource).preferredColorScheme(.dark)
		DiscountGridView(discountsDataSource: discountDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
		DiscountGridView(discountsDataSource: discountDataSource)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
