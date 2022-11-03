//
//  DateHolidayExtension.swift
//  MCRAvocado
//
//  Created by Onie on 02.11.2022.
//

import Foundation
// swiftlint:disable: all
extension Date {
	var isUSHoliday: Bool {
		let components = Calendar.current.dateComponents([.year, .month, .day, .weekday, .weekdayOrdinal], from: self)
		guard let year = components.year,
					let month = components.month,
					let day = components.day,
					let weekday = components.weekday,
					let weekdayOrdinal = components.weekdayOrdinal else { return false }

		let easterDateComponents = Date.dateComponentsForEaster(year: year)
		let easterMonth: Int = easterDateComponents?.month ?? -1
		let easterDay: Int = easterDateComponents?.day ?? -1
		let memorialDay = Date.dateComponentsForMemorialDay(year: year)?.day ?? -1

		// weekday is Sunday==1 ... Saturday==7
		// weekdayOrdinal is nth instance of weekday in month

		switch (month, day, weekday, weekdayOrdinal) {
		case (1, 1, _, _): return true                      // Happy New Years
		case (1, _, 2, 3): return true                      // Martin Luther King - 3rd Mon in Jan
		case (2, 14, _, _): return true                     // Valentine day - 14th in Feb
		case (2, _, 2, 3): return true                      // Washington's Birthday - 3rd Mon in Feb
		case (3, 17, _, _): return true                     // Saint Patrick's Day - 17th Mar
		case (easterMonth, easterDay, _, _): return true    // Easter - rocket science calculation
		case (5, _, 1, 2): return true                      // Mothers day - 2nd Sun in May
		case (5, memorialDay, _, _): return true            // Memorial Day
		case (5, _, 1, 3): return true                      // Fathers day - 3rd Sun in May
		case (7, 4, _, _): return true                      // Independence Day - 4th July
		case (9, _, 2, 1): return true                      // Labor Day - 1st Mon in Sept
		case (10, _, 2, 2): return true                     // Columbus Day - 2nd Mon in Oct
		case (10, 31, _, _): return true                    // Halloween Day - 31st Oct
		case (11, 11, _, _): return true                    // Veterans Day  - 11th Nov
		case (11, _, 5, 4): return true                     // Happy Thanksgiving - 4th Thurs in Nov
		case (12, 25, _, _): return true                    // Christmas/Happy Holiday
		case (12, 31, _, _): return true                    // New years Eve
		default: return false
		}
	}

	// New Year
	static func newYearDay(year: Int) -> Date? {
		var firstDayJan = DateComponents()
		firstDayJan.month = 1 // 1st Month
		firstDayJan.day  = 1  // 1st Day
		firstDayJan.year = year
		return Calendar.current.date(from: firstDayJan)
	}
	// Martin Luther King Jr Day
	static func martinLKDay(year: Int) -> Date? {
		var thirdMonJan = DateComponents()
		thirdMonJan.month = 1 // 1 month
		thirdMonJan.weekday  = 2 // Monday
		thirdMonJan.weekdayOrdinal = 3 // 3rd week
		thirdMonJan.year = year
		return Calendar.current.date(from: thirdMonJan)
	}
	// Valentine Day
	static func valentineDay(year: Int) -> Date? {
		var firstDayFeb = DateComponents()
		firstDayFeb.month = 2
		firstDayFeb.day  = 14
		firstDayFeb.year = year
		return Calendar.current.date(from: firstDayFeb)
	}
	// Washington's Birthday
	static func washingtonBDay(year: Int) -> Date? {
		var thirdMonFeb = DateComponents()
		thirdMonFeb.month = 2 //month Feb
		thirdMonFeb.weekday  = 2 // Monday
		thirdMonFeb.weekdayOrdinal = 3 //3rd week
		thirdMonFeb.year = year
		return Calendar.current.date(from: thirdMonFeb)
	}
	// Saint Patrick's Day
	static func stPatrickDay(year: Int) -> Date? {
		var seventeenthMar = DateComponents()
		seventeenthMar.month = 3
		seventeenthMar.day  = 17
		seventeenthMar.year = year
		return Calendar.current.date(from: seventeenthMar)
	}
	// Easter
	static func easterHoliday(year: Int) -> Date? {
		guard let dateComponents = Date.dateComponentsForEaster(year: year) else { return nil }
		return Calendar.current.date(from: dateComponents)
	}

	static func dateComponentsForEaster(year: Int) -> DateComponents? {
		// Easter calculation from Anonymous Gregorian algorithm
		// AKA Meeus/Jones/Butcher algorithm
		let a = year % 19
		let b = Int(floor(Double(year) / 100))
		let c = year % 100
		let d = Int(floor(Double(b) / 4))
		let e = b % 4
		let f = Int(floor(Double(b+8) / 25))
		let g = Int(floor(Double(b-f+1) / 3))
		let h = (19*a + b - d - g + 15) % 30
		let i = Int(floor(Double(c) / 4))
		let k = c % 4
		let L = (32 + 2*e + 2*i - h - k) % 7
		let m = Int(floor(Double(a + 11*h + 22*L) / 451))
		var dateComponents = DateComponents()
		dateComponents.month = Int(floor(Double(h + L - 7*m + 114) / 31))
		dateComponents.day = ((h + L - 7*m + 114) % 31) + 1
		dateComponents.year = year
		guard let easter = Calendar.current.date(from: dateComponents) else { return nil } // Convert to calculate weekday, weekdayOrdinal
		return Calendar.current.dateComponents([.year, .month, .day, .weekday, .weekdayOrdinal], from: easter)
	}
	// Mother's Days
	static func mothersDay(year: Int) -> Date? {
		var secondSunMay = DateComponents()
		secondSunMay.month = 5
		secondSunMay.weekday = 1
		secondSunMay.weekdayOrdinal = 2
		secondSunMay.year = year
		return Calendar.current.date(from: secondSunMay)
	}

	// Memorial Day
	static func dateComponentsForMemorialDay(year: Int) -> DateComponents? {
		guard let memorialDay = Date.memorialDay(year: year) else { return nil }
		return NSCalendar.current.dateComponents([.year, .month, .day, .weekday, .weekdayOrdinal], from: memorialDay)
	}
	static func memorialDay(year: Int) -> Date? {
		let calendar = Calendar.current
		var firstMondayJune = DateComponents()
		firstMondayJune.month = 6
		firstMondayJune.weekdayOrdinal = 1  // 1st in month
		firstMondayJune.weekday = 2 // Monday
		firstMondayJune.year = year
		guard let refDate = calendar.date(from: firstMondayJune) else { return nil }
		var timeMachine = DateComponents()
		timeMachine.weekOfMonth = -1
		return calendar.date(byAdding: timeMachine, to: refDate)
	}
	// Fathers Day
	static func fathersDay(year: Int) -> Date? {
		var thirdSunJun = DateComponents()
		thirdSunJun.month = 6
		thirdSunJun.weekday = 1
		thirdSunJun.weekdayOrdinal = 3
		thirdSunJun.year = year
		return Calendar.current.date(from: thirdSunJun)
	}

	// Independence Day
	static func independenceDay(year: Int) -> Date? {
		var fourthJuly = DateComponents()
		fourthJuly.month = 7
		fourthJuly.day = 4
		fourthJuly.year = year
		return Calendar.current.date(from: fourthJuly)
	}
	// Labor Day
	static func laborDay(year: Int) -> Date? {
		var firstSunSep = DateComponents()
		firstSunSep.month = 9
		firstSunSep.weekday = 2
		firstSunSep.weekdayOrdinal = 1
		firstSunSep.year = year
		return Calendar.current.date(from: firstSunSep)
	}
	// Columbus Day
	static func columbusDay(year: Int) -> Date? {
		var firstSunSep = DateComponents()
		firstSunSep.month = 10
		firstSunSep.weekday = 2
		firstSunSep.weekdayOrdinal = 2
		firstSunSep.year = year
		return Calendar.current.date(from: firstSunSep)
	}
	// Halloween
	static func halloweenDay(year: Int) -> Date? {
		var thirtyFirstOct = DateComponents()
		thirtyFirstOct.month = 10
		thirtyFirstOct.day = 31
		thirtyFirstOct.year = year
		return Calendar.current.date(from: thirtyFirstOct)
	}

	// Veterans
	static func veteransDay(year: Int) -> Date? {
		var eleventhNov = DateComponents()
		eleventhNov.month = 11
		eleventhNov.day = 11
		eleventhNov.year = year
		return Calendar.current.date(from: eleventhNov)
	}
	// Thanks Giving Day
	static func thanksGivingDay(year: Int) -> Date? {
		var fourthThuNov = DateComponents()
		fourthThuNov.month = 11
		fourthThuNov.weekday = 5
		fourthThuNov.weekdayOrdinal = 4
		fourthThuNov.year = year
		return Calendar.current.date(from: fourthThuNov)
	}
	// Christmas
	static func christmasDay(year: Int) -> Date? {
		var christmasDay = DateComponents()
		christmasDay.month = 12
		christmasDay.day = 25
		christmasDay.year = year
		return Calendar.current.date(from: christmasDay)
	}

	// New Year Eve
	static func newYearEve(year: Int) -> Date? {
		var thirtyFirstDec = DateComponents()
		thirtyFirstDec.month = 12
		thirtyFirstDec.day = 31
		thirtyFirstDec.year = year
		return Calendar.current.date(from: thirtyFirstDec)
	}

	static func getHolidayArray(year: Int) -> [Date?] {
		return [newYearEve(year:year),
						Date.martinLKDay(year: year),
						Date.valentineDay(year: year),
						Date.washingtonBDay(year: year),
						Date.stPatrickDay(year: year),
						Date.easterHoliday(year: year),
						Date.mothersDay(year: year),
						Date.memorialDay(year: year),
						Date.fathersDay(year: year),
						Date.independenceDay(year: year),
						Date.laborDay(year: year),
						Date.columbusDay(year: year),
						Date.halloweenDay(year: year),
						Date.veteransDay(year: year),
						Date.thanksGivingDay(year: year),
						Date.christmasDay(year: year)]
	}
}
