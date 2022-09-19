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
	enum AppTexts {
		public static let menuText = "Menu"
		public static let cartText = "Cart"
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
		public static let bananaPancake = "A fresh-flipped power stack. Four pancakes filled with fresh banana slices. Topped with glazed strawberries & more banana slices."
		public static let pumpkinPancake = "Four pumpkin spice pancakes made with real pumpkin and seasonal spices, crowned with creamy whipped topping."
		public static let chocolatePancakes = "We think chocolate is perfect any time of day. Four fluffy chocolate pancakes filled with chocolate chips, topped with a drizzle of chocolate syrup & more chocolate chips."

		public static let icedCoffee = "Handcrafted, iced cold brew coffee made from 100% Arabica beans. Comes with milk for you to customize as you like."
		public static let raspberryLemonade = "A blend of lemonade, lemon-lime soda & blue raspberry syrup. Topped with fresh blueberries."
		public static let bagel = "Crispy bacon, fresh lettuce and tomato are served on a toasted everything bagel."
		public static let oatmeal = "High in fiber and antioxidant, 100% whole grain! The best healthy breakfast ever."
		public static let vanillaCupcake = "Vanilla cupcake with topped with creamy whipped vanilla buttercream and rainbow sprinkles"
		public static let cheeseOmelette = "This cheese omelette is light, tender, and fluffy, made with 3 eggs and filled with buttery Emmentaler cheese"
		public static let eggsBenedict = "Two halves of an English muffin, each topped with Canadian bacon, a poached egg, and hollandaise sauce"
	}
}
