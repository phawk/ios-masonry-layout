//
//  ZoomedImageViewController.swift
//  Masonry
//
//  Created by Pete Hawkins on 22/10/2016.
//  Copyright © 2016 Dawson Andrews Ltd. All rights reserved.
//

import UIKit

class ZoomedImageViewController: UIViewController {
    var photo: Photo!

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.backgroundColor = UIColor.clear
        navBar.shadowImage = UIImage()
        navBar.topItem!.rightBarButtonItem?.action = #selector(self.closeModal)
        
        view.backgroundColor = UIColor.black

        print("Zoomed View loading image \(photo.url)")
        
        imageView.loadRemoteImage(byUrl: photo.url) { error in
            if error != nil {
                print("Error loading image! \(error?.localizedDescription)")
                return
            }
            
            print("Setup updateMinZoomScaleForSize!!!")
            
            self.updateMinZoomScaleForSize(self.view.bounds.size)
        }
    }
    
    func closeModal() {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)

        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    }
    
    func updateConstraintsForSize(_ size: CGSize) {
        print("updateConstraintsForSize \(imageView.frame)")
        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        
        print("yOffset: \(yOffset) xOffset: \(xOffset)")
        
        view.layoutIfNeeded()
    }

}

extension ZoomedImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }
}
