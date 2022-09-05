//
//  DoubleExtension.swift
//  MCRAvocado
//
//  Created by Onie on 04.09.2022.
//

extension Double {
	var roundTwoAfterPoint: Double {
		(self * 100).rounded() / 100
	}
}
