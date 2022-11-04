//
//  AvocadoStepper.swift
//  MCRAvocado
//
//  Created by Onie on 27.10.2022.
//

import SwiftUI

struct AvocadoStepper: View {
	@Binding var value: Int
	var range: ClosedRange<Int>

	init(value: Binding<Int>, in bounds: ClosedRange<Int>) {
		self._value = value
		self.range = bounds
	}

	var body: some View {
		HStack {
			Spacer()
			HStack {
				Button(action: {
					if range.contains(value - 1) { value -= 1 }
				}, label: {
					LargeDescriptionText(lineText: "-")
				})
				LargeDescriptionText(lineText: value.formatted())
				Button(action: {
					if range.contains(value + 1) { value += 1 }
				}, label: {
					LargeDescriptionText(lineText: "+")
				})
			}
			.font(.body)
			.padding(.vertical, 8 )
			.frame(width: 80)
			.foregroundColor(.white)
			.background {
				Capsule()
					.fill(Color.onboardingAccentColor)
			}
		}
		.buttonStyle(.plain)
	}
}

// MARK: - Preview
struct AvocadoStepper_Previews: PreviewProvider {
	static var previews: some View {
		AvocadoStepper(value: .constant(2), in: 1...100)
	}
}
