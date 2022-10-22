//
//  FileManager.swift
//  MCRAvocado
//
//  Created by Onie on 15.10.2022.
//

import Foundation

public extension FileManager {
	static var documentsDirectoryURL: URL {
		return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
	}
}
