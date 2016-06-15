//
//  Cocktail+JSON.swift
//  lipsty2
//
//  Created by Martin Ziserman on 13/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Cocktail {

    convenience init(json: JSON) {
        self.init()
        
        self.name = json["name"].stringValue
        self.id = json["id"].intValue
    }

}