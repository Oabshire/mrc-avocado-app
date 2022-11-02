//
//  DateFormatter.swift
//  MCRAvocado
//
//  Created by Onie on 30.10.2022.
//

import Foundation

extension Date {
	var toMonthYearString: String {
		let dateFormatter = DateFormatter()

		dateFormatter.dateFormat = "MMMM YYYY"
		return dateFormatter.string(from: self)
	}

	var toMonthDayYearString: String {
		let dateFormatter = DateFormatter()

		dateFormatter.dateFormat = "MMM dd YYYY"
		return dateFormatter.string(from: self)
	}

	var toMinutesHoursString: String {
		let dateFormatter = DateFormatter()

		dateFormatter.dateFormat = "hh:mm a"
		return dateFormatter.string(from: self)
	}

	var fullDateString: String {
		let dateFormatter = DateFormatter()

		dateFormatter.dateFormat = "yyyy.MM.dd hh:mm a"
		return dateFormatter.string(from: self)
	}
}
