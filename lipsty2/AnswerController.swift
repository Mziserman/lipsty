//
//  AnswerController.swift
//  lipsty2
//
//  Created by Martin Ziserman on 15/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import Foundation
import UIKit


class AnswerController: UIPageViewController {
    private(set) lazy var orderedViewController: [UIViewController] = {
        return [UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Cocktail1"),
                UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Cocktail2"),
                UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Cocktail3")]
    }()
    let secondOrderedViewController = []
    
    @IBOutlet weak var cocktail1Title: UILabel!
    @IBOutlet weak var cocktail1Star1: UIImageView!
    @IBOutlet weak var cocktail1Star2: UIImageView!
    @IBOutlet weak var cocktail1Star3: UIImageView!
    @IBOutlet weak var cocktail1Image: UIImageView!
    @IBOutlet weak var cocktail1Ingredients: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = secondOrderedViewController.first {
            setViewControllers([firstViewController], direction: .Forward, animated: true, completion: nil)
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let request = defaults.dictionaryForKey("userResponses") {
            CocktailManager.searchCocktails(request) { (cocktails) in
                self.cocktail1Title.text = cocktails[0].name
                
                
                //                switch cocktails.count {
                //                case 3:
                //                case 2:
                //                case 1:
                //                default:
                //                    break
                //                }
            }
        }

    }
    
    
    
}

extension AnswerController: UIPageViewControllerDataSource {
//    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = secondOrderedViewController.indexOf(viewController) else {
//            return nil
//        }
//        
//        let nextIndex = viewControllerIndex + 1
//        let orderedViewControllerCount = secondOrderedViewController.count
//        
//        guard orderedViewControllerCount != nextIndex else {
//            return nil
//        }
//        
//        guard orderedViewControllerCount > nextIndex else {
//            return nil
//        }
//        
//        return secondOrderedViewController[nextIndex]
//    }
//    
//    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
//        guard let ViewControllerIndex = secondOrderedViewController.indexOf(viewController) else {
//            return nil
//        }
//        let previousIndex = ViewControllerIndex - 1
//        
//        guard previousIndex >= 0 else {
//            return nil
//        }
//        
//        guard secondOrderedViewController.count > previousIndex else {
//            return nil
//        }
//        
//        return secondOrderedViewController[previousIndex]
//    }
}
func newAnswerViewController(identifier: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(identifier)
}

