//
//  SplashView.swift
//  MCRAvocado
//
//  Created by Onie on 06.10.2022.
//

import SwiftUI

struct SplashView: View {
	struct Leaf: View {

		let isCurrent: Bool
		let isCompleting: Bool
		let isZooming: Bool

		var body: some View {
			Capsule()
				.foregroundColor(isCurrent ? .white : Color.mainBackgroundColor)
				.frame(width: 20, height: isCurrent ? 50 : 20)
				.offset(
					isCurrent
					? .init(width: 0, height: -25 )
					: .init(width: 0, height: 0)
				)

				.scaleEffect(isZooming ? 1000 : 1 )

				.animation(.easeIn(duration: 0.75), value: isCompleting)
				.animation(.easeIn(duration: 1.5), value: isZooming)
				.animation(.easeIn(duration: 0.75), value: isCurrent)
		}
	}
	let leavesCount = 4
	@State var currentIndex = -1
	@State var completed = false
	@State var isVisible = true
	@State var zooming = false

	let shootUp =  AnyTransition.scale(scale: 0.01)
		.animation(.easeIn(duration: 1))

	var body: some View {
		VStack {

			HStack(spacing: completed ? -20 : 10) {
				ForEach(0..<leavesCount, id: \.self) { index in
					Leaf(
						isCurrent: index == currentIndex,
						isCompleting: completed,
						isZooming: zooming
					)
				}
			}
			.onAppear(perform: animate)
		}
	}

	func animate() {
		var iteration = 0

		Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in

			iteration += 1
			currentIndex = (currentIndex + 1) % leavesCount
			if iteration == 13 {
				currentIndex = -1
				timer.invalidate()
				completed = true
				DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
					withAnimation {
						zooming = true
					}
				}
			}
		}
	}
}

struct SplashView_Previews: PreviewProvider {
	static var previews: some View {
		SplashView()
	}
}
