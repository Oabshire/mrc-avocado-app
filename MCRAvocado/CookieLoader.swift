//
//  CookieLoader.swift
//  MCRAvocado
//
//  Created by Onie on 08.10.2022.
//

import SwiftUI

/// Cookie Loader without modern concurrency
struct CookieLoader {
	
	// MARK: Cookie Load Error
	enum CookieLoadError: Error {
		case invalidResponse
		case invalidURL
		
	}
	
	func downloadCookie(from cookieURL: String) throws {
		// create url from string
		guard let url = URL(string: cookieURL) else {
			throw CookieLoadError.invalidURL
		}
		let request = URLRequest(url: url)

		// perform task
		performTask(with: request) { result in
			switch result {
				// if success print cookie on main thread
			case .success(let fields):
				if let fields  = fields {
					let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)
					DispatchQueue.main.async {
						print("*-----------Cookies----------*")
						print(cookies)
					}
				}

				// if failure print error
			case .failure(let error):
				print(error)
			}
		}
	}

	private func performTask(with request: URLRequest, completion: @escaping (Result<[String : String]?, Error>) -> Void) {

		URLSession.shared.dataTask(with: request) { _, response, error in
			// error checking
			if let error = error {
				completion(.failure(error))
				return
			}

			// try to get fields
			guard  let httpResponse = response as? HTTPURLResponse,
						 let fields = httpResponse.allHeaderFields as? [String: String]
			else {
				completion(.failure( CookieLoadError.invalidResponse))
				return
			}

			completion(.success(fields))
		}.resume()
	}
}
