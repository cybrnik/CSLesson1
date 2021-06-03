//
//  ViewController.swift
//  ClientServerSwift
//
//  Created by Nikita on 24.05.2021.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var WkWebView: WKWebView!{
        didSet{
            WkWebView.navigationDelegate = self
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //VkService().requestVK()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7033153"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.103")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
                WkWebView.load(request)
        

    }
    
    
    
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        
        Session.shared.token = token ?? ""
        
        
        decisionHandler(.cancel)
        print(Session.shared.token)
        VkService().VKgetFriends()
        VkService().VKgetPhotos()
        VkService().VKgetGroups()
        VkService().VKgetGroupsSearch(text: "MDK")
    }
    
}
    
    




