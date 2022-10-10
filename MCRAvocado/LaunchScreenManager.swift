//
//  LaunchScreenManager.swift
//  MCRAvocado
//
//  Created by Onie on 09.10.2022.
//

import SwiftUI

enum LaunchScreenPhase {
	case first
	case second
	case complete
}

final class LaunchScreenManager: ObservableObject {
	@Published private(set) var state: LaunchScreenPhase = .first

	func dismiss() {
		self.state = .second
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.state = .complete
		}
	}
}
