//
//  AllCocktailsController.swift
//  lipsty2
//
//  Created by Martin Ziserman on 13/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import UIKit

class AllCocktailsController: UIViewController, UITableViewDataSource {
    
    var from: String!
    var overlay: UIView?
    @IBOutlet weak var cocktailsTableView: UITableView!
    lazy var cocktails = [Cocktail]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cocktailsTableView.dataSource = self;

        self.overlay = UIView(frame: view.frame)
        self.overlay!.backgroundColor = UIColor(netHex:0xe51655)
        self.overlay!.alpha = 1.0
        
        view.addSubview(self.overlay!)
        if self.from == "home" {
            CocktailManager.searchCocktails() { (cocktails) in
                self.cocktails.removeAll()
                self.cocktails+=cocktails
                
                self.overlay?.removeFromSuperview()
                
                self.cocktailsTableView.reloadData()
            }
        } else if self.from == "apiCall" {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let request = defaults.dictionaryForKey("userResponses") {
                CocktailManager.searchCocktails(request) { (cocktails) in
                    self.cocktails.removeAll()
                    self.cocktails+=cocktails

                    self.overlay?.removeFromSuperview()

                    self.cocktailsTableView.reloadData()
                }
            }
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cocktailDetailViewController = segue.destinationViewController as! CocktailDetailViewController
        
        if let selectedIndexPath = cocktailsTableView.indexPathForSelectedRow {
            let cocktail = cocktails[selectedIndexPath.row]
            
            cocktailDetailViewController.cocktail = cocktail
            
            cocktailsTableView.deselectRowAtIndexPath(selectedIndexPath, animated: true)
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView datasource methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let cocktail = cocktails[row]
        
        let cocktailTableViewCell = tableView.dequeueReusableCellWithIdentifier(CocktailTableViewCell.identifier, forIndexPath: indexPath) as! CocktailTableViewCell
        
        cocktailTableViewCell.cocktail = cocktail
        
        return cocktailTableViewCell
        
    }
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}