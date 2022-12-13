//
//  ReviewView.swift
//  MCRAvocado
//
//  Created by Onie on 12.12.2022.
//

import SwiftUI

struct ReviewView: View {
	@Binding var isShown: Bool
	var body: some View {
		Text("Hello, I'm Review View")
	}
}

struct ReviewView_Previews: PreviewProvider {
	static var previews: some View {
		ReviewView(isShown: .constant(true))
	}
}
