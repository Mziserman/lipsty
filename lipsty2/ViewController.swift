//
//  ViewController.swift
//  lipsty2
//
//  Created by Martin Ziserman on 11/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var female: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "checkAll" {
            let allCocktailsController = segue.destinationViewController as! AllCocktailsController
            allCocktailsController.from = "home"
        } else if segue.identifier == "apiCall" {
            let allCocktailsController = segue.destinationViewController as! AllCocktailsController
            allCocktailsController.from = "apiCall"
        }
        
    }
    
    //MARK: Buttons actions
    var answers = [String: String]()

    //MARK: Sex
    @IBAction func maleAction(sender: AnyObject) {
        self.setAnswer("male", key: "sex")
    }
    @IBAction func femaleAction(sender: AnyObject) {
        self.setAnswer("female", key: "sex")
    }
    
    //MARK: Skill
    @IBAction func noobAction(sender: AnyObject) {
        self.setAnswer("easy", key: "skill")
    }
    @IBAction func mediumAction(sender: AnyObject) {
        self.setAnswer("easy/or/average", key: "skill")
    }
    @IBAction func proAction(sender: AnyObject) {
        self.setAnswer("easy/or/average/or/advanced", key: "skill")
    }
    @IBAction func payAction(sender: AnyObject) {
        self.setAnswer("easy/or/average/or/advanced", key: "skill")
    }
    
    //MARK: Target
    @IBAction func fancyAction(sender: AnyObject) {
        self.setAnswer("cocktail-glass/or/wine-glass", key: "target")
    }
    @IBAction func sportAction(sender: AnyObject) {
        self.setAnswer("highball-glass/or/cocktail-glass", key: "target")
    }
    @IBAction func hipsterAction(sender: AnyObject) {
        self.setAnswer("wine-glass/or/rocks-glass", key: "target")
    }
    @IBAction func basicAction(sender: AnyObject) {
        self.setAnswer("rocks-glass/or/highball-glass", key: "target")
    }
    
    //MARK: Color
    @IBAction func yellowAction(sender: AnyObject) {
        self.setAnswer("yellow", key: "color")
    }
    @IBAction func pinkAction(sender: AnyObject) {
        self.setAnswer("pink", key: "color")
    }
    @IBAction func redAction(sender: AnyObject) {
        self.setAnswer("red", key: "color")
    }
    @IBAction func orangeAction(sender: AnyObject) {
        self.setAnswer("brown", key: "color")
    }
    @IBAction func greenAction(sender: AnyObject) {
        self.setAnswer("green", key: "color")
    }
    @IBAction func elseAction(sender: AnyObject) {
        self.setAnswer("else", key: "color")
    }
    @IBAction func blackAction(sender: AnyObject) {
        self.setAnswer("clear", key: "color")
    }
    @IBAction func blueAction(sender: AnyObject) {
        self.setAnswer("blue", key: "color")
    }
    
    //MARK: occasion
    @IBAction func afterNoonAction(sender: AnyObject) {
        self.setAnswer("pre-dinner/or/afternoon", key: "occasion")
    }
    @IBAction func preDinerAction(sender: AnyObject) {
        self.setAnswer("after-dinner/or/pre-dinner", key: "occasion")
    }
    @IBAction func partyAction(sender: AnyObject) {
        self.setAnswer("evening/or/after-dinner", key: "occasion")
    }
    
    //MARK: weather
    @IBAction func rainAction(sender: AnyObject) {
        self.setAnswer("rain", key: "weather")
    }
    @IBAction func coldAction(sender: AnyObject) {
        self.setAnswer("cold", key: "weather")
    }
    @IBAction func hotAction(sender: AnyObject) {
        self.setAnswer("hot", key: "weather")
    }
    @IBAction func noClueAction(sender: AnyObject) {
        self.setAnswer("noclue", key: "weather")
    }
    
    func setAnswer(answer: String, key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if var answers = defaults.dictionaryForKey("userResponses") {
            answers[key] = answer
            defaults.setValue(answers, forKey: "userResponses")
            defaults.synchronize()
        } else {
            defaults.setValue(answers, forKey: "userResponses")
            defaults.synchronize()
        }
    }
    
}

