//
//  MenuViewController.swift
//  UIKitAssignment
//
//  Created by Onie on 11.09.2022.
//

import SwiftUI
import UIKit

/// Menu Table
class MenuViewController: UITableViewController {

	/// Source of data for cells with menu item information
	private var dataSource: MenuModel


	/// Init
	/// - Parameter dataSource: Source of data for cells with menu item information
	init(dataSource: MenuModel) {
		self.dataSource = dataSource
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = TextLibrary.AppTexts.menuText
		self.tableView.backgroundColor = .mainBackgroundColor
		self.tableView.separatorStyle = .none

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

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let sectionNumber = indexPath.section
		let cellNumber = indexPath.row
		let menuItem = dataSource.section[sectionNumber].menuItems[cellNumber]
		let detailViewController = DetailHostingController(menuItem: menuItem)
		//this way №1
		// Screen dismiss on button "Add to order"
		self.present(detailViewController, animated: true)

		//this way №2
		// Screen dismiss on button "Back"
		//navigationController?.pushViewController(detailViewController, animated: true)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		dataSource.section[section].name.rawValue.uppercased()
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
