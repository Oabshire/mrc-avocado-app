//
//  DateFormatter.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import Foundation

extension Date {

	/// Formats a date into a string "MMMM YYYY"
	var toMonthYearString: String {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "en_us")
		dateFormatter.dateFormat = "MMMM YYYY"
		return dateFormatter.string(from: self)
	}

	/// Formats a date into a string "MMM dd YYYY"
	var toMonthDayYearString: String {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "en_us")
		dateFormatter.dateFormat = "MMM dd YYYY"
		return dateFormatter.string(from: self)
	}

	/// Formats a date into a string "hh:mm a"
	var toMinutesHoursString: String {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "en_us")
		dateFormatter.dateFormat = "hh:mm a"
		return dateFormatter.string(from: self)
	}

	/// Formats a date into a string "yyyy.MM.dd hh:mm a"
	var fullDateString: String {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "en_us")
		dateFormatter.dateFormat = "yyyy.MM.dd hh:mm a"
		return dateFormatter.string(from: self)
	}
}

extension Date {
	/// Get date components
	func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
		return calendar.dateComponents(Set(components), from: self)
	}

	/// Get  one date component
	func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
		return calendar.component(component, from: self)
	}
}
