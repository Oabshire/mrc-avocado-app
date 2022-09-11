//
//  MenuViewRepresentable.swift
//  MCRAvocado
//
//  Created by Onie on 10.09.2022.
//

import UIKit
import SwiftUI

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
		return collectionView
	}

	func updateUIView(_ uiView: UITableView, context: Context) {
	}

	func makeCoordinator() -> MenuViewController {
		MenuViewController(dataSource: dataSource)
	}
}

struct TestUIList: View {
	var body: some View {
		UIList(dataSource: menuDataSource)
	}
}
