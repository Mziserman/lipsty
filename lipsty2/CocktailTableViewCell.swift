//
//  CocktailTableViewCell.swift
//  lipsty2
//
//  Created by Martin Ziserman on 13/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import UIKit
import Haneke

class CocktailTableViewCell: UITableViewCell {
    static let identifier = "cocktailCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var cocktailImageView: UIImageView!
    var cocktail: Cocktail! {
        didSet {
            //Refresh UI
            titleLabel.text = cocktail.name
            if let posterPathUrl = NSURL(string: cocktail.listImage) {
                cocktailImageView.hnk_setImageFromURL(posterPathUrl)
            }            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
