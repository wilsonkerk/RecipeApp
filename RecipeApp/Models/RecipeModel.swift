//
//  Recipe.swift
//  RecipeApp
//
//  Created by Wilson Kerk on 14/06/2023.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    let id: UUID
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublished: String
    let url: String
}

extension Recipe {
    static let all: [Recipe] = [
        Recipe(id: UUID(), name: "Raspberry Truffle Brownies",
               image: "https://www.forksoverknives.com/wp-content/uploads/Raspberry-Brownies-vertical.jpg",
               description: "These dense, fudgy, vegan brownies have loads of melt-in-your-mouth raspberry yumminess. Frozen berries actually will work better here because the dough is very stiff, and frozen berries are easier to fold in.",
               ingredients: "4 ounces unsweetened chocolate, chopped, \n½ cup raspberry jam, ½ cup evaporated cane juice or cane sugar \n½ cup unsweetened applesauce \n2 teaspoons pure vanilla extract \n½ teaspoon almond extract, 1½ cups whole wheat pastry flour\n¼ cup unsweetened cocoa powder\n¼ teaspoon baking powder\n½ teaspoon baking soda\n¼ teaspoon salt\n1 cup raspberries, frozen or fresh",
               directions: "Preheat the oven to 350ºF. Line an 8 x 8-inch pan with a 10-inch square of parchment paper or have ready an 8 x 8-inch nonstick or silicone baking pan. \nMelt the chocolate in either a double boiler or the microwave. Set aside.\nIn a large mixing bowl, vigorously mix together the jam, sweetener, and applesauce. Stir in the vanilla, almond extract, and the melted chocolate.\nSift in the flour, cocoa powder, baking powder, baking soda, and salt. Mix very well until a stiff dough forms. Fold in the raspberries.\nSpread the mixture into the prepared pan. It will be very thick; you’ll need to use your hands to even the batter out in the pan.\nBake the brownies for 16 to 18 minutes. Remove them from the oven and let cool completely. These taste especially good and fudgy after being refrigerated for a few hours.\nNote: The brownies are still very gooey after the baking time is complete, but don’t worry—that’s what you want with brownies! Gooey out of the oven means that they will be nice and fudgy when they cool. Allow them to cool completely and chill in the fridge for a few hours for best results.",
               category: "Dessert",
               datePublished: "02-10-2014",
               url: "https://www.forksoverknives.com/recipes/vegan-desserts/raspberry-truffle-brownies/")
    ]
}

