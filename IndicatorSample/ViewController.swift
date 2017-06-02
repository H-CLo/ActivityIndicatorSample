//
//  ViewController.swift
//  IndicatorSample
//
//  Created by HungCLo on 9/11/16.
//  Copyright © 2016 HungCLo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startIndicator(_ sender: AnyObject) {
        let uiView = showIndicator(self.view)
        uiView.isHidden = false
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

    func showIndicator(_ uiView: UIView) -> UIView {
        /* Adding a new UIView to the self*/
        let container: UIView = UIView()
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor(red: 0.7, green: 0.6, blue: 0.5, alpha: 0.3)
        
        /* Create a view for activityIndicator */
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.brown
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        /* Create Indicator cotainer */
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        
        actInd.startAnimating()
        
        return container
    }
    
    /* show indicator using the GCD display_after */
    func displayTime(_ setime: Double, uiview: UIView) {
        let seconds = setime
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            uiview.isHidden = true
            // Hello world
        })
    }
    
    func testGit_Branch() {
        print("Hello, this a fuction to test Git branch")
    }
    
    func testMaster() {
        print("Hello, this is a function to test master branch")
    }
    
    //Hello world

}

