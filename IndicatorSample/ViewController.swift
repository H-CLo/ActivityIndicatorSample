//
//  ViewController.swift
//  IndicatorSample
//
//  Created by HungCLo on 9/11/16.
//  Copyright © 2016 HungCLo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startIndicator(sender: AnyObject) {
        let uiView = showIndicator(self.view)
        uiView.hidden = false
        displayTime(3.0, uiview: uiView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showIndicator(uiView: UIView) -> UIView {
        /* Adding a new UIView to the self*/
        let container: UIView = UIView()
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor(red: 0.7, green: 0.6, blue: 0.5, alpha: 0.3)
        
        /* Create a view for activityIndicator */
        let loadingView: UIView = UIView()
        loadingView.frame = CGRectMake(0, 0, 80, 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.brownColor()
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        /* Create Indicator cotainer */
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        actInd.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.height / 2)
        
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        
        actInd.startAnimating()
        
        return container
    }
    
    /* show indicator using the GCD display_after */
    func displayTime(setime: Double, uiview: UIView) {
        let seconds = setime
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            uiview.hidden = true
        })
    }

}

