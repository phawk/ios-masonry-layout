//
//  ViewController.swift
//  Masonry
//
//  Created by Pete Hawkins on 22/10/2016.
//  Copyright © 2016 Dawson Andrews Ltd. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var photos = Photo.all()
    var pageViewController: CarouselViewController!
    
    @IBOutlet var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        logoImage.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        logoImage.contentMode = UIViewContentMode.scaleAspectFit
        self.navigationItem.titleView = logoImage
        
        // Use clear effect
        let navBar = self.navigationController?.navigationBar
        // Use clear for more blur colour coming through: navBar!.backgroundColor = UIColor.clear
        navBar!.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:0.9)
        navBar!.isTranslucent = true
        navBar!.setBackgroundImage(UIImage(), for: .default)
        navBar!.shadowImage = UIImage()
        
        // Add blur view
        var bounds = self.navigationController?.navigationBar.bounds
        bounds = bounds!.offsetBy(dx: 0.0, dy: -20.0)
        bounds!.size.height = bounds!.height + 20.0
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = bounds!
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.navigationController?.navigationBar.addSubview(visualEffectView)
        self.navigationController?.navigationBar.sendSubview(toBack: visualEffectView)
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        collectionView!.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.imageView.image = nil
        cell.photo = photos[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pageViewController = CarouselViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.modalPresentationStyle = .fullScreen
        pageViewController.photos = photos
        pageViewController.startingIndex = indexPath.item
        present(pageViewController, animated: true, completion: nil)
    }
}

extension ViewController : PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath, withWidth width:CGFloat) -> CGFloat {
        let photo = photos[indexPath.item]
        let photoSize = CGSize(width: photo.width, height: photo.height)
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRect(aspectRatio: photoSize, insideRect: boundingRect)
        return rect.size.height
    }
}
