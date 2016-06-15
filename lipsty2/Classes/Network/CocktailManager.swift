//
//  CocktailManager.swift
//  lipsty2
//
//  Created by Martin Ziserman on 13/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CocktailManager {
    
    typealias ResultCocktail = (cocktails: [Cocktail]) -> Void
    
    static func searchCocktails(resultCocktail: ResultCocktail) {
        let searchCocktailUrl = UrlBuilder.basicSearch()
        
        Alamofire.request(.GET, searchCocktailUrl).responseJSON { (response) in
            
            var cocktails = [Cocktail]()
            
            if let jsonRoot = response.result.value as? [String: AnyObject] {
                if let results = jsonRoot["result"] as? [AnyObject] {
                    for result in results {
                        let jsonCocktail = JSON(result)
                        let cocktail = Cocktail(json: jsonCocktail)
                        cocktails.append(cocktail)
                    }
                }
            }
            resultCocktail(cocktails: cocktails)
        }
    }
    
    static func searchCocktails(request: Dictionary<String, AnyObject> ,resultCocktail: ResultCocktail) {
        let searchCocktailUrl = UrlBuilder.requestUrl(request)
        
        Alamofire.request(.GET, searchCocktailUrl).responseJSON { (response) in
            
            var cocktails = [Cocktail]()
            
            if let jsonRoot = response.result.value as? [String: AnyObject] {
                if let results = jsonRoot["result"] as? [AnyObject] {
                    for result in results {
                        let jsonCocktail = JSON(result)
                        let cocktail = Cocktail(json: jsonCocktail)
                        cocktails.append(cocktail)
                    }
                }
            }
            resultCocktail(cocktails: cocktails)
        }
    }
}
