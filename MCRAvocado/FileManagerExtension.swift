//
//  FileManagerExtension.swift
//  MCRAvocado
//
//  Created by Onie on 02.11.2022.
//

import Foundation

extension FileManager {
	/// URL of documents directory
	static var documentsDirectoryURL: URL {
		return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
	}
}
