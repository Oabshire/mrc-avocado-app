//
//  DetailHostingController.swift
//  MCRAvocado
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI

class DetailHostingController: UIViewController {
	
	var menuItem: MenuItem
	var menuDetailView = UIHostingController(rootView: MenuDetailView())
	
	init(menuItem: MenuItem) {
		self.menuItem = menuItem
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		var detailView = MenuDetailView(menuItem: menuItem)
		detailView.donePressed  = { [weak self] in
			self?.dismissThisViewController()
		}
		menuDetailView = UIHostingController(rootView: detailView)
		
		addChild(menuDetailView)
		view.addSubview(menuDetailView.view)
		
		setupConstrains()
	}
	
	func dismissThisViewController() {
		self.dismiss(animated: true, completion: nil)
	}
}

private extension DetailHostingController {
	func setupConstrains() {
		menuDetailView.view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			menuDetailView.view.topAnchor.constraint(equalTo: view.topAnchor),
			menuDetailView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			menuDetailView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			menuDetailView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
}
