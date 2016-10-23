//
//  ZoomedImageViewController.swift
//  Masonry
//
//  Created by Pete Hawkins on 22/10/2016.
//  Copyright © 2016 Dawson Andrews Ltd. All rights reserved.
//

import UIKit

/*
 TODO:
 - Add UIPagedViewController to allow sliding next/prev images
 - Add double tap to zoom in or out
 - Drag image to close view
 */

class ZoomedImageViewController: UIViewController {
    var photo: Photo!

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black

        scrollView.delegate = self
        scrollView.frame = view.frame
        
        imageView.loadRemoteImage(byUrl: photo.url) { error in
            if error != nil {
                print("Error loading image! \(error?.localizedDescription)")
                return
            }
            
            self.imageView.frame = self.scrollView.frame
            
            self.updateMinZoomScaleForSize(self.view.bounds.size)
            self.adjustCenterPosition()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        updateMinZoomScaleForSize(self.view.bounds.size)
        adjustCenterPosition()
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)

        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
        scrollView.maximumZoomScale = minScale * 2.5
    }
    
    func adjustCenterPosition() {
        let scrollViewSize = scrollView.bounds
        let imageSize = imageView.frame
        
        let horizontalSpacing = scrollViewSize.width > imageSize.width ? (scrollViewSize.width - imageSize.width) / 2 : 0
        let verticalSpacing = scrollViewSize.height > imageSize.height ? (scrollViewSize.height - imageSize.height) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpacing, horizontalSpacing, verticalSpacing, horizontalSpacing)
    }

}

extension ZoomedImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        adjustCenterPosition()
    }
}
