//
//  DiscountGridView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

/// Grid of  discounts
struct DiscountGridView: View {

	/// discounts to display
	let discountsDataSource: [Discount]

	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: .init(repeating: .init(), count: 2)) {
					ForEach(discountsDataSource) { discount in
						DiscountGridRow(discount: discount)
					}
				}.padding()
			}
			.navigationBarTitle("Discounts")
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct DiscountGridView_Previews: PreviewProvider {
	static var previews: some View {
		DiscountGridView(discountsDataSource: Discount.getAllDiscounts)
		DiscountGridView(discountsDataSource: Discount.getAllDiscounts).preferredColorScheme(.dark)
		DiscountGridView(discountsDataSource: Discount.getAllDiscounts)
			.previewLayout(.fixed(width: 568, height: 320))
		DiscountGridView(discountsDataSource: Discount.getAllDiscounts)
			.previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
