//
//  MenuViewController.swift
//  MCRAvocado
//
//  Created by Onie on 10.09.2022.
//

import SwiftUI
import UIKit

class MenuViewController: UITableViewController {
	var dataSource: MenuModel

	init(dataSource: MenuModel) {
		self.dataSource = dataSource
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.estimatedRowHeight = 80
		self.tableView.rowHeight = UITableView.automaticDimension
		tableView.register(MenuItemCell.self, forCellReuseIdentifier: MenuItemCell.reuseID)
	}

	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		dataSource.section.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		dataSource.section[section].menuItems.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemCell.reuseID, for: indexPath) as? MenuItemCell
		else { return  UITableViewCell() }
		let sectionNumber = indexPath.section
		let cellNumber = indexPath.row
		cell.dataModel = MenuCellModel(menuItem: dataSource.section[sectionNumber].menuItems[cellNumber])
		return cell
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		dataSource.section[section].name.rawValue.uppercased()
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
