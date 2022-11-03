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
		Task {
			try await Task.sleep(nanoseconds: 1_000_000_000)
			await complete()
		}
	}

	@MainActor
	private func complete() {
		self.state = .complete
	}
}
