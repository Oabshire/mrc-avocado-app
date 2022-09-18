//
//  DiscountGridView.swift
//  MCRAvocado
//
//  Created by Onie on 18.09.2022.
//

import SwiftUI

struct DiscountGridView: View {
	@State private var discountsDataSource = availableDiscounts

	var body: some View {
		NavigationView {
			ScrollView{
				LazyVGrid(columns: .init(repeating: .init(), count: 2)) {
					ForEach(discountsDataSource) { discountsDataSource in
						MenuGridCell(text: discountsDataSource.rawValue)
						
					}
				}.padding()
			}
			.navigationBarTitle("Discounts")
			.background(Color.mainBackgroundColor)
		}
	}
}

struct DiscountGridView_Previews: PreviewProvider {
	static var previews: some View {
		MenuGridView()
	}
}
