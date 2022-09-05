import UIKit
/// category of meal
enum MenuItemType {
	case scramble
	case omelets
	case eggsBenedict
	case oatmeal
	case pancake
	case waffle
	case bagel
	case dessert
	case side
	case tea
	case coffee
	case juice
	case milkShake
	case lemonade
	case soda
	case hotChocolate
	case other
}

/// Type of milk used for coffee, tea, and hot chocolate
enum MilkType {
	case whole
	case nonFat
	case soy
	case almond
	case coconut
	case oatMilk
	case heavyCream
}


/// Cup size for beverages
enum CupSize {
	case tall
	case grande
	case venti
}

/// MenuItem
struct MenuItem: Hashable {
	let name: String
	var price: Double
	var isInStock: Bool
	let calories: Int
	let description: String?
	let type: MenuItemType
	let withIce: Bool?
	let typeOfMilk: MilkType?
	let cupSize: CupSize?
	
	init(name: String, price: Double, isInStock: Bool, calories: Int, description: String? = nil, type: MenuItemType, withIce: Bool? = nil , typeOfMilk: MilkType? = nil, cupSize: CupSize? = nil) {
		self.name = name
		self.price = price
		self.isInStock = isInStock
		self.calories = calories
		self.description = description
		self.type = type
		self.withIce = withIce
		self.typeOfMilk = typeOfMilk
		self.cupSize = cupSize
	}
}

/// Order
struct Order {
	var orderedItems: [MenuItem: Int]
	let numberOfPersons: Int
	let tableNumber: Int
	let dateOfCreation: Date
	
	var amountWithoutDiscount: Double {
		var totalPrice = 0.0
		for a in orderedItems {
			totalPrice += a.key.price
		}
		return totalPrice
	}
	
	//MARK: - Assignment 8 (HW3)
	var appliedDiscount: Discount = .none
	
	var currentDiscountedAmount: Double {
		let amountAfterDiscount = amountWithoutDiscount - amountWithoutDiscount * Double(appliedDiscount.percentageValue) / 100.0
		return  amountAfterDiscount.roundTwoAfterPoint
	}
	
	//MARK: - Assignment 9 (HW3)
	lazy var maximumDiscount: Double = {
		(amountWithoutDiscount * Double(Discount.newYear.percentageValue)/100).roundTwoAfterPoint
	}()
	
	mutating func addMenuItem(item: MenuItem, amount: Int) {
		guard item.isInStock else {
			print("Sorry! Out of Stock :(")
			return
		}
		let existingAmount: Int = orderedItems[item] ?? 0
		orderedItems[item] = existingAmount + amount
	}
	
	func printOrderedItems() {
		for (item, amount) in orderedItems {
			print("\(createStringForPrint(from: item)) : \(amount)")
		}
	}
	
	func printOrderedItemsNameAndAmount() {
		for (item, amount) in orderedItems {
			print("\(item.name) : \(amount)")
		}
	}
	
	//MARK: - Assignment 10 (HW3)
	func calculateTotalAmountAfterApplyingDiscount() -> Double {
		return currentDiscountedAmount
	}
}

private extension Order {
	func createStringForPrint(from menuItem: MenuItem) -> String {
		var result = "Name: \(menuItem.name), Price: \(menuItem.price), Is in stock: \(menuItem.isInStock), Calories: \(menuItem.calories), Type: \(menuItem.type)"
		if let description = menuItem.description {
			result += ", Description: \(description)"
		}
		if let typeOfMilk = menuItem.typeOfMilk {
			result += ", Type of milk: \(typeOfMilk)"
		}
		if let withIce = menuItem.withIce {
			result += ", With ice: \(withIce)"
		}
		if let cupSize = menuItem.cupSize {
			result += ", Cup Size: \(cupSize)"
		}
		result += ", Type: \(menuItem.type)"
		
		return result
	}
}


//MARK: - Assignment 1 (HW3)

/// Calculate the discounted Amount
/// - Parameter discountPercentage: discountPercentage (5%, 10% and so on)
/// - Returns:  total amount after discount.
func  calculateDiscountedAmount(from amount: Double, with discountPercentage: Int) -> Double {
	let amountAfterDiscount = amount - amount * Double(discountPercentage) / 100.0
	return  amountAfterDiscount.roundTwoAfterPoint
}

//MARK: - Assignment 2 (HW3)

/// Calculate the amount with 5% discount
/// - Returns: total amount after 5% discount.
func  calculateDiscountedAmount(from amount: Double) -> Double {
	let discountPercentage = 5
	let amountAfterDiscount = amount - amount * Double(discountPercentage) / 100.0
	return amountAfterDiscount.roundTwoAfterPoint
}

typealias Operate = (Double, Int) -> Double

//MARK: - Assignment 3 (HW3)
func printDiscount(_ operate: Operate, _ a: Double, _ b: Int) {
	print(operate(a,b))
}

//MARK: - Assignment 4 (HW3)

var discountedAmountClosure = { (a: Double, b: Int) -> Double in
	let amountAfterDiscount = a - a * Double(b) / 100.0
	return amountAfterDiscount.roundTwoAfterPoint
}

let orderedItems: [MenuItem: Int] = [:]

enum DescriptionText {
	public static let butterWaffle = "Our house-made Belgian Waffle topped with whipped real butter"
	public static let eggsBaconWaffle = "Our house-made Belgian waffle is served with 2 eggs your way and 2 custom-cured hickory-smoked bacon strips"
	public static let blueberryPancake = "Four blueberry pancakes, crowned with creamy whipped topping"
	public static let icedCoffee = "Handcrafted, iced cold brew coffee made from 100% Arabica beans. Comes with milk for you to customize as you like."
}

let butterWaffle = MenuItem(name: "Waffle with butter",
							price: 12.79,
							isInStock: false,
							calories: 570,
							description: DescriptionText.butterWaffle,
							type: .waffle)

let eggsBaconWaffle = MenuItem(name: "Waffle with eggs and bacon",
							   price: 14.99,
							   isInStock: true,
							   calories: 1000,
							   description: DescriptionText.eggsBaconWaffle,
							   type: .waffle)

let blueberryPancake = MenuItem(name: "Blueberry pancake",
								price: 11.99,
								isInStock: true,
								calories: 610,
								description: DescriptionText.blueberryPancake,
								type: .pancake)

let blackTea = MenuItem(name: "Black tea",
						price: 2.99,
						isInStock: true,
						calories: 0,
						description: nil,
						type: .tea,
						withIce: nil,
						typeOfMilk: nil,
						cupSize: .tall)

let icedCoffee = MenuItem(name: "Iced coffee",
						  price: 5.99,
						  isInStock: true,
						  calories: 20,
						  description: DescriptionText.icedCoffee,
						  type: .coffee,
						  withIce: true,
						  typeOfMilk: .coconut,
						  cupSize: .tall)

let orangeJuice = MenuItem(name: "orangeJuice",
						   price: 4.99,
						   isInStock: true,
						   calories: 150,
						   description: nil,
						   type: .juice,
						   withIce: false,
						   typeOfMilk: nil,
						   cupSize: .grande)

let orangeJuiceTall = MenuItem(name: "orangeJuice",
							   price: 4.99,
							   isInStock: true,
							   calories: 150,
							   description: nil,
							   type: .juice,
							   withIce: false,
							   typeOfMilk: nil,
							   cupSize: .tall)

var order = Order(orderedItems: [eggsBaconWaffle: 1, blueberryPancake: 1,icedCoffee:1, orangeJuice: 1],
				  numberOfPersons: 2,
				  tableNumber: 28,
				  dateOfCreation: Date())
order.addMenuItem(item: butterWaffle, amount: 2)
order.addMenuItem(item: orangeJuice, amount: 2)
order.addMenuItem(item: orangeJuiceTall, amount: 1)

//MARK: - Assignment 1 (HW3)
print(order.amountWithoutDiscount)
print(calculateDiscountedAmount(from: order.amountWithoutDiscount, with: 5))
//MARK: - Assignment 2 (HW3)
print(calculateDiscountedAmount(from: order.amountWithoutDiscount))
//MARK: - Assignment 3 (HW3)
printDiscount({amount , discount in
	calculateDiscountedAmount(from: amount, with: discount)
}, order.amountWithoutDiscount, 5)
//MARK: - Assignment 4 (HW3)
print (discountedAmountClosure(order.amountWithoutDiscount, 5))

//MARK: - Assignment 5 (HW3)
let menuItems = [butterWaffle, eggsBaconWaffle, blueberryPancake, blackTea, icedCoffee, orangeJuice]

let increasedMenuItems: [MenuItem] = menuItems.map {
	var item = $0
	item.price = $0.price  + $0.price * 0.5
	return item
}

//MARK: - Assignment 6 (HW3)
let discountMap = ["New Year": 25,
				   "Martin Luther King’s Birthday": 5,
				   "Washington’s Birthday": 5,
				   "Memorial Day": 15,
				   "Juneteenth National Independence Day": 20,
				   "Independence Day": 5,
				   "Labor Day": 5,
				   "Columbus Day":5,
				   "Veterans’ Day": 15,
				   "Thanksgiving Day": 20,
				   "Christmas Day": 20
].sorted{$0.value > $1.value}
print(discountMap)

//MARK: - Assignment 7 (HW3)

enum Discount {
	case newYear
	case martinLutherKing
	case washingtons
	case memorialDay
	case nationalIndependenceDay
	case laborDay
	case columbusDay
	case veteransDay
	case thanksgivingDay
	case christmasDay
	case none
	
	var percentageValue: Int {
		switch self {
		case .newYear:
			return 25
		case .thanksgivingDay, .nationalIndependenceDay, .christmasDay:
			return 20
		case .memorialDay, .veteransDay:
			return 15
		case .martinLutherKing, .washingtons, .laborDay, .columbusDay:
			return 5
		case .none:
			return 0
		}
	}
}

func printDiscount(for discount: Discount) {
	print(discount.percentageValue)
}
printDiscount(for: .columbusDay)

//MARK: - Assignment 8 (HW3)
order.appliedDiscount = .columbusDay
print(order.currentDiscountedAmount)

//MARK: - Assignment 9 (HW3)
order.amountWithoutDiscount
order.maximumDiscount

//MARK: - Assignment 10 (HW3)

order.calculateTotalAmountAfterApplyingDiscount()

//MARK: - Assignment 11 (HW3)

protocol DiscountProtocol {
	var discountType: Discount { get set}
	var discountPercentage: Int { get }
	func calculateDiscount(for order: Order) -> Double
}

class DiscountClass: DiscountProtocol {
	var discountType: Discount
	
	var discountPercentage: Int { discountType.percentageValue }
	
	init(discountType: Discount) {
		self.discountType = discountType
	}
	func calculateDiscount(for order: Order) -> Double {
		(order.amountWithoutDiscount * Double(discountPercentage)/100).roundTwoAfterPoint
	}
}

let discountClass = DiscountClass(discountType: .columbusDay)
let discountAmount = discountClass.calculateDiscount(for: order)

//MARK: - Assignment 12 (HW3)
extension Double {
	var roundTwoAfterPoint: Double {
		(self * 100).rounded() / 100
	}
}

