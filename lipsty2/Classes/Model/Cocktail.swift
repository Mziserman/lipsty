//
//  Cocktail.swift
//  lipsty2
//
//  Created by Martin Ziserman on 13/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import Foundation
import SwiftyJSON

class Cocktail {
    var name: String!
    var id: String!
    var skill: Int!
    var story: String!
    var color: String!
    var ingredients: [String]!
    var listImage: String!
    var bigImage: String!
    var video: String!
    
    init() {
    
    }
}

extension Cocktail {
    
    convenience init(json: JSON) {
        self.init()
        
        self.name = json["name"].stringValue
        self.id = json["id"].stringValue
        self.skill = json["skill"]["value"].intValue
        self.story = json["story"].stringValue
        self.color = json["color"].stringValue
        self.ingredients = []
        
        for index in 0 ... json["ingredients"].arrayValue.count - 1 {
            var ingredient = json["ingredients"][index].dictionaryValue
            self.ingredients.append(ingredient["textPlain"]!.stringValue)
        }
        
        self.listImage = "http://assets.absolutdrinks.com/drinks/100x140/\(self.id).jpg";
        self.bigImage = "http://assets.absolutdrinks.com/drinks/transparent-background-white/200x270/\(self.id).png"
        
        for index in 0 ... json["videos"].arrayValue.count {
            if json["videos"][index]["type"].stringValue == "youtube" {
                self.video = json["videos"][index]["video"].stringValue
            }
        }
    }
    
}
