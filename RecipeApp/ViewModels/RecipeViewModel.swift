//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Wilson Kerk on 15/06/2023.
//

import Foundation

class RecipesViewModel: ObservableObject {
   @Published private(set) var recipes: [Recipe] = []
   @Published private(set) var recipeTypes: [String] = []
    
    let dataFileName = "recipe.xml"
    
    init() {
        recipes = RecipeXMLParser().loadRecipesFromXML()
        recipeTypes = RecipeXMLParser().loadRecipesTypesFromXML()
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
        RecipeXMLParser().saveRecipesToXML(recipes: recipes)
    }
    
}
