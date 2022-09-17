//
//  MenuViewRepresentable.swift
//  MCRAvocado
//
//  Created by Onie on 10.09.2022.
//

import UIKit
import SwiftUI

/// Representable struct to embed in SwiftUI
struct UIList: UIViewRepresentable {

	var dataSource: MenuModel

	func makeUIView(context: Context) -> UITableView {
		let collectionView = UITableView(frame: .zero, style: .plain)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.dataSource = context.coordinator
		collectionView.delegate = context.coordinator
		collectionView.separatorStyle = .none
		collectionView.register(MenuItemCell.self, forCellReuseIdentifier: MenuItemCell.reuseID)
		collectionView.backgroundColor = .mainBackgroundColor
		collectionView.addSubview(context.coordinator.view) 
		return collectionView
	}

	func updateUIView(_ uiView: UITableView, context: Context) {
	}

	func makeCoordinator() -> MenuViewController {
		MenuViewController(dataSource: dataSource)
	}
}

/// Table for using in SwiftUI
struct MenuViewRepresentable: View {
	@Binding var menuIsShowing: Bool
	var body: some View {
		NavigationView {
			UIList(dataSource: menuDataSource).navigationBarTitle(TextLibrary.AppTexts.menuText)
				.navigationBarTitleDisplayMode(.inline)
				.navigationBarItems(leading: Button(action: { menuIsShowing = false }) {
					Text("Done")
				})
				.background(Color.mainBackgroundColor)
		}
	}
}
