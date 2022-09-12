//
//  OrderCellView.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

/// Cell for ordered items
struct OrderCellView: View {
	
	var menuItem: MenuItem
	
	@State var value: Int = 1
	
	var body: some View {
		HStack{
			Image("pancake")
				.resizable()
				.frame(width: Constants.General.cellsImageWidthHeight,
							 height: Constants.General.cellsImageWidthHeight)
			Spacer()
			VStack{
				OnboardingLineText(lineText: menuItem.name).foregroundColor(.black)
				HStack{
					OnboardingLineText(lineText: "$ " + String(menuItem.price)).foregroundColor(.black).frame(maxWidth: 125)
					Spacer()
					Stepper(value: $value, in: 1...99) {
						Text(String(value)).bold().foregroundColor(.black)
					}.frame(maxWidth: 125)
				}
			}
		}
		.padding()
		.background(RoundedRectangle(cornerRadius: Constants.General.cellsCornerRadius).fill(Color.mainImageColor))
	}
}


struct OrderCellView_Preview: PreviewProvider {
	
	static var previews: some View {
		OrderCellView(menuItem: orderDataSource.orderedItems.first!.key)
		OrderCellView(menuItem: orderDataSource.orderedItems.first!.key).preferredColorScheme(.dark)
		OrderCellView(menuItem: orderDataSource.orderedItems.first!.key).previewLayout(.fixed(width: 568, height: 320))
		OrderCellView(menuItem: orderDataSource.orderedItems.first!.key).previewLayout(.fixed(width: 568, height: 320))
			.preferredColorScheme(.dark)
	}
}
