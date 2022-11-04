//
//  MainLaunchScreenView.swift
//  MCRAvocado
//
//  Created by Onie on 09.10.2022.
//

import SwiftUI

/// View with loading animation
struct MainLaunchScreenView: View {

	/// Manager of lunch screen to control AnimationView
	@EnvironmentObject var launchScreenManager: LaunchScreenManager

	/// Is firste Stage of Animation (Rotating Seed)
	@State var firstPhaseIsAnimating: Bool = false
	/// Is  second Stage of Animation (Scale Seed)
	@State var secondPhaseIsAnimating: Bool = false

	private let timer = Timer.publish(every: 0.65,
																		on: .main,
																		in: .common).autoconnect()
	var body: some View {
		ZStack {
			background
			logo
			seed
		}.onReceive(timer) { _ in
			withAnimation(.spring()) {
				switch launchScreenManager.state {
				case .first:
					firstPhaseIsAnimating.toggle()
				case .second:
					withAnimation(.easeInOut) {
						secondPhaseIsAnimating.toggle()
					}
				default: break
				}
			}
		}
	}
}

// MARK: - Private
private extension MainLaunchScreenView {

	var background: some View {
		Color.defaultBackgroundColor
			.edgesIgnoringSafeArea(.all)
	}

	var logo: some View {
		Image("avocado")
			.font(.system(size: 200))
			.foregroundColor(.onboardingAccentColor)
			.offset(x: 12, y: -12)
			.opacity(firstPhaseIsAnimating ? 1 : 0.5)
	}

	var seed: some View {
		ZStack {
			Circle()
				.frame(width: 55, height: 55)
				.foregroundColor(.mainBackgroundColor)

			Circle()
				.trim(from: 0.6, to: 0.8)
				.stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
				.foregroundColor(.white.opacity(0.8))

				.frame(width: 45, height: 45)
		}
		.scaleEffect(firstPhaseIsAnimating ? 1.5: 1)
		.scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.height/4 : 1)
		.rotationEffect(.degrees(firstPhaseIsAnimating ? 360 : 0))
	}
}

// MARK: - Preview
struct LaunchScreenView_Previews: PreviewProvider {
	static var previews: some View {
		let launchScreenManager = LaunchScreenManager()
		MainLaunchScreenView()
			.environmentObject(launchScreenManager)
	}
}
