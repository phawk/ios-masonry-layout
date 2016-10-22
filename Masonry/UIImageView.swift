//
//  UIImageView.swift
//  UsedCarsNI
//
//  Created by Pete Hawkins on 14/10/2016.
//  Copyright © 2016 Pete Hawkins. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadRemoteImage(byUrl webUrl: String) {
        let url = URL(string: webUrl)
        
        func loadRemoteImageLogger(_ info: String) {
            print("UIImageView:loadImageByUrl: \(info)")
        }
        
        guard url != nil else {
            loadRemoteImageLogger("malformed webUrl: \(webUrl)")
            return
        }
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 11
        
        let defaultSession = URLSession(configuration: sessionConfig)
        
        var dataTask: URLSessionDataTask?
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        dataTask = defaultSession.dataTask(with: url!) { data, resp, error in
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            guard error == nil else {
                loadRemoteImageLogger("Error downloading image: \(error!.localizedDescription)")
                return
            }
            guard data != nil else {
                loadRemoteImageLogger("Error with data: \(error?.localizedDescription)")
                return
            }
            guard let httpResp = resp as? HTTPURLResponse else {
                loadRemoteImageLogger("Error with httpResp")
                return
            }
            guard httpResp.statusCode == 200 else {
                loadRemoteImageLogger("Error with http status code \(httpResp.statusCode)")
                return
            }
            
            DispatchQueue.main.async {
                loadRemoteImageLogger("\(webUrl) loaded")
                let image = UIImage(data: data!)
                
                if image != nil {
                    self.image = image
                }
                else {
                    loadRemoteImageLogger("failed to load image, data mismatch")
                }
            }
        }
        
        dataTask?.resume()
    }
}
