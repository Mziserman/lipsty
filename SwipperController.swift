//
//  SwipperController.swift
//  lipsty2
//
//  Created by Martin Ziserman on 13/06/2016.
//  Copyright © 2016 Martin Ziserman. All rights reserved.
//

import Foundation
import UIKit

class SwipperController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bounds = UIScreen.mainScreen().bounds
        print(bounds)
        let width = bounds.size.width
        let height = bounds.size.height
        
        let vc0 = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController0")
        print(vc0!)
        self.addChildViewController(vc0!)
        self.scrollView.addSubview(vc0!.view)
        vc0!.didMoveToParentViewController(self)
        
        let vc1 = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController1")
        var frame1 = CGRectMake(self.view.frame.size.width , 0, width, height)
        
        frame1.origin.x = self.view.frame.size.width
        vc1!.view.frame = frame1
        
        self.addChildViewController(vc1!)
        self.scrollView.addSubview(vc1!.view)
        vc1!.didMoveToParentViewController(self)

        
        let vc2 = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController2")
        var frame2 = vc2!.view.frame
        frame2.origin.x = self.view.frame.size.width * 2
        vc2!.view.frame = frame2
        
        self.addChildViewController(vc2!)
        self.scrollView.addSubview(vc2!.view)
        vc2!.didMoveToParentViewController(self)
    
        let vc3 = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController3")
        var frame3 = vc3!.view.frame
        frame3.origin.x = self.view.frame.size.width * 3
        vc3!.view.frame = frame3
        
        self.addChildViewController(vc3!)
        self.scrollView.addSubview(vc3!.view)
        vc3!.didMoveToParentViewController(self)
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 4, self.view.frame.height - 66)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
