//
//  StringLibrary.swift
//  MCRAvocado
//
//  Created by Onie on 20.08.2022.
//

/// Text library used in the application
enum TextLibrary { }

extension TextLibrary {
	
	/// Texts used in views
	enum ViewTexts {
		public static let welcomeText = "Welcome,"
		public static let userNameText = "Anastasiia"
		public static let onboardingTitleText = "Avocado"
		public static let onboardingFirstText = "Choose menu items and add them to order"
		public static let onboardingSecondText = "Total amount will be calculated"
		public static let onboardingThirdText = "Write a review of the menu item and add a photo of the dish"
	}
}

extension TextLibrary {
	
	/// Texts used as descriptions of MenuItem struct
	enum MenuItemDescription {
		public static let butterWaffle = "Our house-made Belgian Waffle topped with whipped real butter"
		public static let eggsBaconWaffle = "Our house-made Belgian waffle is served with 2 eggs your way and 2 custom-cured hickory-smoked bacon strips"
		public static let blueberryPancake = "Four blueberry pancakes, crowned with creamy whipped topping"
		public static let icedCoffee = "Handcrafted, iced cold brew coffee made from 100% Arabica beans. Comes with milk for you to customize as you like."
	}
}
