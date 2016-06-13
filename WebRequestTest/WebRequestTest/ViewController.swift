//
//  ViewController.swift
//  WebRequestTest
//
//  Created by Miwand Najafe on 2016-02-26.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
//    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var webView: UIWebView!
//    var webView: WKWebView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        webView = WKWebView()
//        container.addSubview(webView)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        loadRequest("https://developer.apple.com/swift/blog/")
    }
    
    func loadRequest(urlString:String) {
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    
    @IBAction func loadSwift(sender: AnyObject) {
        
        loadRequest("https://developer.apple.com/swift/blog/")
    }
    
    @IBAction func loadGossip(sender: AnyObject) {
        loadRequest("http://www.tmz.com/")
        
    }

    @IBAction func loadSteak(sender: AnyObject) {
       loadRequest("http://primecutsblog.com/2008/11/06/why-i-love-steak-on-the-bone-and-why-you-should-too/")
        
    }

}

