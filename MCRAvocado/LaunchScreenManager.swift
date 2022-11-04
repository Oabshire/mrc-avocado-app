//
//  LaunchScreenManager.swift
//  MCRAvocado
//
//  Created by Onie on 09.10.2022.
//

import SwiftUI

/// Phases of LaunchScreen
enum LaunchScreenPhase {
	case first
	case second
	case alert
	case complete
}

/// Manager of lunchScreen to control AnimationView
final class LaunchScreenManager: ObservableObject {
	@Published private(set) var state: LaunchScreenPhase = .first

	/// Transfer the animation into the second phase, and after 1 second - into the third.
	func dismiss() {
		self.state = .second
		Task {
			try await Task.sleep(nanoseconds: 1_000_000_000)
			await complete()
		}
	}

	/// Transfer the animation into the second phase, and after 1 second - into the third.
	func showAlertMassage() {
		self.state = .second
		Task {
			try await Task.sleep(nanoseconds: 1_000_000_000)
			await complete()
		}
	}

	// MARK: - Private
	@MainActor
	private func complete() {
		self.state = .complete
	}

	@MainActor
	private func alertMessage() {
		self.state = .alert
	}
}
