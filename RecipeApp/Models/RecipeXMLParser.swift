//
//  RecipeXMLParser.swift
//  RecipeApp
//
//  Created by Wilson Kerk on 15/06/2023.
//

import Foundation
import AEXML

class RecipeXMLParser: NSObject, XMLParserDelegate {
    var currentElement: String = ""
    var id: UUID = UUID()
    var name: String = ""
    var image: String = ""
    var desc: String = ""
    var ingredients: String = ""
    var directions: String = ""
    var category: String = ""
    var datePublished: String = ""
    var url: String = ""
    var recipes: [Recipe] = []
    var recipeTypes: [String] = []

    func loadRecipesFromXML() -> [Recipe] {
        var recipes: [Recipe] = []
        
        guard let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("recipes.xml") else {
            print("Failed to create file URL")
            return recipes
        }
        
        do {
            let xmlData = try Data(contentsOf: fileURL)
            let xmlDoc = try AEXMLDocument(xml: xmlData)
            
            guard let recipeElements = xmlDoc.root["Recipe"].all else {
                return recipes
            }
            
            for recipeElement in recipeElements {
                let id = recipeElement["Id"].value ?? UUID().uuidString
                let name = recipeElement["Name"].value ?? ""
                let image = recipeElement["Image"].value ?? ""
                let description = recipeElement["Description"].value ?? ""
                let ingredients = recipeElement["Ingredients"].value ?? ""
                let directions = recipeElement["Directions"].value ?? ""
                let categoryValue = recipeElement["Category"].value ?? Category.main.rawValue
                let datePublished = recipeElement["DatePublished"].value ?? ""
                let url = recipeElement["URL"].value ?? ""
                
                if let category = Category(rawValue: categoryValue) {
                    let recipe = Recipe(id: UUID(uuidString: id)!, name: name, image: image, description: description, ingredients: ingredients, directions: directions, category: category.rawValue, datePublished: datePublished, url: url)
                    recipes.append(recipe)
                }
            }
        } catch {
            print("Failed to load XML file: \(error)")
        }
        
        return recipes
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        // The parsing has finished, and you can access the extracted data
        print("ID: \(id)")
        print("Name: \(name)")
        print("Image: \(image)")
        print("Description: \(desc)")
        print("Ingredients: \(ingredients)")
        print("Directions: \(directions)")
        print("Category: \(category)")
        print("Date Published: \(datePublished)")
        print("URL: \(url)")
        
        let recipe = Recipe(id: id, name: name, image: image, description: desc, ingredients: ingredients, directions: directions, category: category, datePublished: datePublished, url: url)
        recipes.append(recipe)
    }
    
    // Function to save recipes to an XML file
    func saveRecipesToXML(recipes: [Recipe]) {
        let xml = AEXMLDocument()

        let rootElement = xml.addChild(name: "Recipes")

        // Loop through the recipes and create XML elements for each recipe
        for recipe in recipes {
            let recipeElement = rootElement.addChild(name: "Recipe")
            recipeElement.addChild(name: "Id", value: recipe.id.uuidString)
            recipeElement.addChild(name: "Name", value: recipe.name)
            recipeElement.addChild(name: "Image", value: recipe.image)
            recipeElement.addChild(name: "Description", value: recipe.description)
            recipeElement.addChild(name: "Ingredients", value: recipe.ingredients)
            recipeElement.addChild(name: "Directions", value: recipe.directions)
            recipeElement.addChild(name: "Category", value: recipe.category)
            recipeElement.addChild(name: "DatePublished", value: recipe.datePublished)
            recipeElement.addChild(name: "URL", value: recipe.url)
        }

        // Save the XML to a file
        guard let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("recipes.xml") else {
                print("Failed to create file URL")
                return
            }
        do {
            try xml.xml.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            print("XML file saved successfully")
        } catch {
            print("Failed to save XML file: \(error)")
        }
    }
    
    func loadRecipesTypesFromXML() -> [String] {
        guard let fileURL = Bundle.main.url(forResource: "RecipeTypes", withExtension: "xml") else {
            print("Failed to create file URL")
            return []
        }
        
        do {
            let xmlData = try Data(contentsOf: fileURL)
            let xmlDoc = try AEXMLDocument(xml: xmlData)
            
            let recipeTypeElements = xmlDoc.root.children
              
            for recipeTypeElement in recipeTypeElements {
                let categoryValue = recipeTypeElement.value!

                recipeTypes.append(categoryValue)
            }
        } catch {
            print("Failed to load XML file: \(error)")
        }
        
        return recipeTypes
    }
}

