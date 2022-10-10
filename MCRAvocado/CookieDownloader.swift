//
//  CookieDownloader.swift
//  MCRAvocado
//
//  Created by Onie on 09.10.2022.
//

import Foundation

struct CookieDownloader {
	func downloadModernCookie() async  {
		let loader = ModernCookieLoader()
		do {
			try await loader.downloadCookie(from: "https://www.raywenderlich.com")
		}
		catch let error {
			print("ERROR: \(error)")
		}
	}

	func downloadCookie() async  {
		let loader = CookieLoader()
		do {
			try loader.downloadCookie(from: "https://www.raywenderlich.com")
		}
		catch let error {
			print("ERROR: \(error)")
		}
	}
}
