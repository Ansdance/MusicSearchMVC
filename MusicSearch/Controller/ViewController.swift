//
//  ViewController.swift
//  MusicSearch
//
//  Created by ANSAR DAULETBAYEV on 08.07.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webview: WKWebView!
    
    var music: ItunesMusic?
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.navigationDelegate = self
        
        guard let musicUrl = music?.previewUrl, let url = URL(string: musicUrl) else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        webview.load(urlRequest)
    }
    
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = self.view.center
        activityIndicator?.hidesWhenStopped = true
        if let indicator = activityIndicator {
            self.view.addSubview(indicator)
        }
    }
    
    // MARK: - WKWebView delegate
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator?.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator?.stopAnimating()
    }
    
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        activityIndicator?.stopAnimating()
//        let alertController = UIAlertController(title: "Error", message: "An error occurred while loading the page: \(error.localizedDescription)", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alertController, animated: true, completion: nil)
//    }
}
