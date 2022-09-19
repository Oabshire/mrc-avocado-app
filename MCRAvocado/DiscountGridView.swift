//
//  DiscountGridView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

struct DiscountGridView: View {
	var discountsDataSource: [Discount]

	var body: some View {
		NavigationView {
			ScrollView{
				LazyVGrid(columns: .init(repeating: .init(), count: 2)) {
					ForEach(discountsDataSource) { discountsDataSource in
						MenuGridRow(text: discountsDataSource.rawValue)
						
					}
				}.padding()
			}
			.navigationBarTitle("Discounts")
		}.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct DiscountGridView_Previews: PreviewProvider {
	static var previews: some View {
		DiscountGridView(discountsDataSource: discountDataSource)
	}
}
