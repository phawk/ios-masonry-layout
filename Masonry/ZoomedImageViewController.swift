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
        
        imageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.doubleTapGestureRecognizer(_:)))
        tapGesture.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tapGesture)
    }
    
    func doubleTapGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        let zoomScale = scrollView.zoomScale
        // zoom out if it bigger than middle scale point. Else, zoom in
        if zoomScale >= scrollView.maximumZoomScale / 2.0 {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        }
        else {
            let center = gestureRecognizer.location(in: gestureRecognizer.view)
            let zoomRect = zoomRectForScale(scrollView.maximumZoomScale, center: center)
            scrollView.zoom(to: zoomRect, animated: true)
        }
    }
    
    fileprivate func zoomRectForScale(_ scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        
        // the zoom rect is in the content view's coordinates.
        // at a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
        // as the zoom scale decreases, so more content is visible, the size of the rect grows.
        zoomRect.size.height = scrollView.frame.size.height / scale
        zoomRect.size.width  = scrollView.frame.size.width  / scale
        
        // choose an origin so as to get the right center.
        zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0)
        zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0)
        
        return zoomRect
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
