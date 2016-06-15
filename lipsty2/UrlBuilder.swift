//
//  UrlBuilder.swift
//  lipsty2
//
//  Created by Martin Ziserman on 13/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import Foundation

class UrlBuilder {
    
    let apiKey = "554d49b3281d4991ab23bcf65f7e5151"
    let baseUrl = "http://addb.absolutdrinks.com/drinks/rating/lt100/"
    let baseQueryUrl = "http://addb.absolutdrinks.com/quickSearch/drinks/"
    
    static func basicSearch() -> String {
        let url = "http://addb.absolutdrinks.com/drinks/rating/lt100/?pageSize=25&apiKey=554d49b3281d4991ab23bcf65f7e5151"
        return url
    }
    static func requestUrl(answers: Dictionary<String, AnyObject>) -> String {
        let url = "http://addb.absolutdrinks.com/drinks/rating/lt100/skill/\(answers["skill"]!)/servedin/\(answers["target"]!)/colored/\(answers["color"]!)/for/\(answers["occasion"]!)/?pageSize=3&apiKey=554d49b3281d4991ab23bcf65f7e5151"
        return url
    }
    
//    
//    static func posterUrl(posterPath: String) -> String {
//        let url = "https://image.tmdb.org/t/p/w130\(posterPath)"
//        
//        return url
//    }
//    
    
}