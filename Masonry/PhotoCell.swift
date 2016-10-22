//
//  PhotoCell.swift
//  Masonry
//
//  Created by Pete Hawkins on 22/10/2016.
//  Copyright © 2016 Dawson Andrews Ltd. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    var photo: Photo! {
        didSet {
            imageView.loadRemoteImage(byUrl: photo.url)
        }
    }
    @IBOutlet var imageView: UIImageView!
}
