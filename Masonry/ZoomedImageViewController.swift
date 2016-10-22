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
        
        imageView.loadRemoteImage(byUrl: photo.url)
    }
    
    func closeModal() {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
