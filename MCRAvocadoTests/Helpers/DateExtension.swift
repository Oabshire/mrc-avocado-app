//
//  DateExtension.swift
//  MCRAvocadoTests
//
//  Created by Onie on 01.11.2022.
//

import Foundation

extension Date {
		init(_ dateString:String) {
				let dateStringFormatter = DateFormatter()
				dateStringFormatter.dateFormat = "yyyy-MM-dd"
				dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
				let date = dateStringFormatter.date(from: dateString)!
				self.init(timeInterval:0, since:date)
		}
}
