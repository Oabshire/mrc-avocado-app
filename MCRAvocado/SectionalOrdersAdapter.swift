//
//  SectionalOrdersAdapter.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import Foundation

struct SectionalOrdersAdapter {
	func sectionOrders(from orders: [OrderContainer]) -> [SectionalOrderModel] {
		var sectionOrders: [String: [OrderContainer]] = [:]
		for order in orders {
			if sectionOrders[order.dateOfCreation?.toMonthYearString ?? ""] != nil {
				sectionOrders[order.dateOfCreation?.toMonthYearString ?? ""]?.append(order)
			} else {
				sectionOrders[order.dateOfCreation?.toMonthYearString ?? ""] = [order]
			}
		}
		var result: [SectionalOrderModel] = []
		for section in sectionOrders {
			var orders: [OrderContainer] = []
			for order in section.value {
				orders.append(order)
			}
			result.append(SectionalOrderModel(orders: orders, sectionName: section.key))
		}
		return result
	}
}
