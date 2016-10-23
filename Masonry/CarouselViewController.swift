//
//  CarouselViewController.swift
//  Masonry
//
//  Created by Pete Hawkins on 22/10/2016.
//  Copyright © 2016 Dawson Andrews Ltd. All rights reserved.
//

import UIKit

class CarouselViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    override var prefersStatusBarHidden: Bool {
        return true
    }
    var photos: [Photo]!
    var startingIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        // Add a close cross
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        navBar.setItems([UINavigationItem()], animated: false)
        navBar.topItem!.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.closeModal))
        navBar.topItem!.rightBarButtonItem?.tintColor = UIColor.white
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.backgroundColor = UIColor.clear
        navBar.shadowImage = UIImage()
        view.addSubview(navBar)
        view.bringSubview(toFront: navBar)
        
        // Load the first frame
        let frameViewController = frameController(withPhoto: photos[startingIndex])
        let viewControllers = [frameViewController]
        setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for subView in self.view.subviews {
            if subView is UIScrollView {
                subView.frame = self.view.bounds
            } else if subView is UINavigationBar {
                print("Bringing Navbar to the front!!")
                self.view.bringSubview(toFront: subView)
            }
        }
    }
    
    func closeModal() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func frameController(withPhoto photo: Photo) -> ZoomedImageViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let zoomedVc = storyboard.instantiateViewController(withIdentifier: "zoomedImageViewController") as! ZoomedImageViewController
        
        zoomedVc.photo = photo
        return zoomedVc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentPhoto = (viewController as! ZoomedImageViewController).photo
        let currentIndex = photos.index(of: currentPhoto!)!
        
        if currentIndex > 0 {
            return frameController(withPhoto: photos![currentIndex - 1])
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentPhoto = (viewController as! ZoomedImageViewController).photo
        let currentIndex = photos.index(of: currentPhoto!)!
        
        if currentIndex < photos!.count - 1 {
            return frameController(withPhoto: photos![currentIndex + 1])
        }
        
        return nil
    }

}
