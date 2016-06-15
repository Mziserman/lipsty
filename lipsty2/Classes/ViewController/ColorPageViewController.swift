//
//  ColorPageViewController.swift
//  lipsty2
//
//  Created by Martin Ziserman on 15/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import Foundation
import UIKit

class ColorPageViewController: UIPageViewController {

    private(set) lazy var orderedViewController: [UIViewController] = {
        return [newColoredViewController("Yellow"),
                newColoredViewController("Pink"),
                newColoredViewController("Orange"),
                newColoredViewController("Red"),
                newColoredViewController("Blue"),
                newColoredViewController("Green"),
                newColoredViewController("Black"),
                newColoredViewController("Else")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedViewController.first {
            self.setViewControllers([firstViewController], direction: .Forward, animated: true, completion: nil)
        }
    }
    
    
    
}

extension ColorPageViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = orderedViewController.count
        
        guard orderedViewControllerCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllerCount > nextIndex else {
            return nil
        }
        
        return orderedViewController[nextIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let ViewControllerIndex = orderedViewController.indexOf(viewController) else {
            return nil
        }
        let previousIndex = ViewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewController.count > previousIndex else {
            return nil
        }
        
        return orderedViewController[previousIndex]
    }
}
func newColoredViewController(color: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("\(color)View")
}







