//
//  CocktailDetailViewController.swift
//  lipsty2
//
//  Created by Martin Ziserman on 13/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import UIKit
import YouTubePlayer

class CocktailDetailViewController: UIViewController {
    
    var cocktail: Cocktail!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    
    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var story: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // affichage de self.title dans la navigation Bar
        self.nameLabel.text = cocktail.name
        if let posterPathUrl = NSURL(string: cocktail.bigImage) {
            bigImage.hnk_setImageFromURL(posterPathUrl)
        }
        self.printStars(cocktail.skill)
        self.printIngredients(cocktail.ingredients)
        self.printStory(cocktail.story)
    }
    
    func printStory(cocktailStory: String) {
        story.text = cocktailStory
        story.lineBreakMode = .ByWordWrapping
        story.numberOfLines = 0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//        let cocktailDetailViewController = segue.destinationViewController as! CocktailDetailViewController
//        
//        if let selectedIndexPath = cocktailsTableView.indexPathForSelectedRow {
//            let cocktail = cocktails[selectedIndexPath.row]
//            
//            cocktailDetailViewController.cocktail = cocktail
//            
//            cocktailsTableView.deselectRowAtIndexPath(selectedIndexPath, animated: true)
//        }
        
    }
    
    func printIngredients(ingredients: [String]) {
        
        for index in 1...ingredients.count - 1 {
            
            let label = UILabel(frame: CGRectMake(0, 0, 200, 21))
            
            let y = CGFloat(200 + index * 18)
            label.center = CGPointMake(300, y)
            
            label.text = ingredients[index]
            label.textAlignment = NSTextAlignment.Left
            label.lineBreakMode = .ByWordWrapping
            label.numberOfLines = 0
            
            self.view.addSubview(label)
        
        }
        
    }
    
    let noLevel = UIImage(named: "no_level")
    let level = UIImage(named: "level")
    func printStars(score: Int) {
        switch score {
        case 0:
            star1.hnk_setImage(self.noLevel!, key: "noLevel")
            star2.hnk_setImage(self.noLevel!, key: "noLevel")
            star3.hnk_setImage(self.noLevel!, key: "noLevel")
        case 1:
            star1.hnk_setImage(self.level!, key: "level")
            star2.hnk_setImage(self.noLevel!, key: "noLevel")
            star3.hnk_setImage(self.noLevel!, key: "noLevel")
        case 2:
            star1.hnk_setImage(self.level!, key: "level")
            star2.hnk_setImage(self.level!, key: "level")
            star3.hnk_setImage(self.noLevel!, key: "noLevel")
        case 3:
            star1.hnk_setImage(self.level!, key: "level")
            star2.hnk_setImage(self.level!, key: "level")
            star3.hnk_setImage(self.level!, key: "level")
        default:
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
