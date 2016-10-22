//
//  UIImageView.swift
//  UsedCarsNI
//
//  Created by Pete Hawkins on 14/10/2016.
//  Copyright © 2016 Pete Hawkins. All rights reserved.
//

import UIKit

enum RemoteImageLoadError : Error {
    case MailformedURL(String)
    case DownloadError(String)
    case BadData(String)
    case HTTPError(String)
}

extension UIImageView {
    func loadRemoteImage(byUrl webUrl: String, onCompletion: ((RemoteImageLoadError?) -> Void)?) {
        let url = URL(string: webUrl)
        
        guard url != nil else {
            onCompletion?(RemoteImageLoadError.MailformedURL("webUrl: \(webUrl)"))
            
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
                DispatchQueue.main.async {
                    onCompletion?(RemoteImageLoadError.DownloadError("Error downloading image: \(error!.localizedDescription)"))
                }
                return
            }
            guard data != nil else {
                DispatchQueue.main.async {
                    onCompletion?(RemoteImageLoadError.BadData("Error with data: \(error?.localizedDescription)"))
                }
                return
            }
            guard let httpResp = resp as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    onCompletion?(RemoteImageLoadError.HTTPError("Error with httpResp"))
                }
                return
            }
            guard httpResp.statusCode == 200 else {
                DispatchQueue.main.async {
                    onCompletion?(RemoteImageLoadError.HTTPError("Error with http status code \(httpResp.statusCode)"))
                }
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                
                if image != nil {
                    self.image = image
                    onCompletion?(nil)
                }
                else {
                    onCompletion?(RemoteImageLoadError.BadData("failed to load image, data mismatch"))
                }
            }
        }
        
        dataTask?.resume()
    }
}
