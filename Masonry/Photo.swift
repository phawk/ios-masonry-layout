//
//  Photo.swift
//  Masonry
//
//  Created by Pete Hawkins on 22/10/2016.
//  Copyright © 2016 Dawson Andrews Ltd. All rights reserved.
//

import Foundation

struct Photo {
    var url: String
    var width: Int
    var height: Int
}

extension Photo {
    static func all() -> [Photo] {
        return [
            Photo(url: "https://a1.dspncdn.com/media/692x/08/46/6b/08466b7162f8550d468b861c3ade3898.jpg", width: 500, height: 402),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://67.media.tumblr.com/bee543222112a8cd2a7a52df92ef30e8/tumblr_npztqqXo321r1vfbso1_1280.jpg", width: 613, height: 852),
            Photo(url: "https://a1.dspncdn.com/media/692x/1d/8e/26/1d8e2649f7bad15c400f298ab5a5b142.jpg", width: 353, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/b2/61/5a/b2615aea825783c026b5ebc137b8fde8.jpg", width: 380, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/08/46/6b/08466b7162f8550d468b861c3ade3898.jpg", width: 500, height: 402),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://67.media.tumblr.com/bee543222112a8cd2a7a52df92ef30e8/tumblr_npztqqXo321r1vfbso1_1280.jpg", width: 613, height: 852),
            Photo(url: "https://a1.dspncdn.com/media/692x/1d/8e/26/1d8e2649f7bad15c400f298ab5a5b142.jpg", width: 353, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/b2/61/5a/b2615aea825783c026b5ebc137b8fde8.jpg", width: 380, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/08/46/6b/08466b7162f8550d468b861c3ade3898.jpg", width: 500, height: 402),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://67.media.tumblr.com/bee543222112a8cd2a7a52df92ef30e8/tumblr_npztqqXo321r1vfbso1_1280.jpg", width: 613, height: 852),
            Photo(url: "https://a1.dspncdn.com/media/692x/1d/8e/26/1d8e2649f7bad15c400f298ab5a5b142.jpg", width: 353, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/b2/61/5a/b2615aea825783c026b5ebc137b8fde8.jpg", width: 380, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/08/46/6b/08466b7162f8550d468b861c3ade3898.jpg", width: 500, height: 402),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://67.media.tumblr.com/bee543222112a8cd2a7a52df92ef30e8/tumblr_npztqqXo321r1vfbso1_1280.jpg", width: 613, height: 852),
            Photo(url: "https://a1.dspncdn.com/media/692x/1d/8e/26/1d8e2649f7bad15c400f298ab5a5b142.jpg", width: 353, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/b2/61/5a/b2615aea825783c026b5ebc137b8fde8.jpg", width: 380, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/08/46/6b/08466b7162f8550d468b861c3ade3898.jpg", width: 500, height: 402),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://67.media.tumblr.com/bee543222112a8cd2a7a52df92ef30e8/tumblr_npztqqXo321r1vfbso1_1280.jpg", width: 613, height: 852),
            Photo(url: "https://a1.dspncdn.com/media/692x/1d/8e/26/1d8e2649f7bad15c400f298ab5a5b142.jpg", width: 353, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/b2/61/5a/b2615aea825783c026b5ebc137b8fde8.jpg", width: 380, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/08/46/6b/08466b7162f8550d468b861c3ade3898.jpg", width: 500, height: 402),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://67.media.tumblr.com/bee543222112a8cd2a7a52df92ef30e8/tumblr_npztqqXo321r1vfbso1_1280.jpg", width: 613, height: 852),
            Photo(url: "https://a1.dspncdn.com/media/692x/1d/8e/26/1d8e2649f7bad15c400f298ab5a5b142.jpg", width: 353, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/b2/61/5a/b2615aea825783c026b5ebc137b8fde8.jpg", width: 380, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/08/46/6b/08466b7162f8550d468b861c3ade3898.jpg", width: 500, height: 402),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://67.media.tumblr.com/bee543222112a8cd2a7a52df92ef30e8/tumblr_npztqqXo321r1vfbso1_1280.jpg", width: 613, height: 852),
            Photo(url: "https://a1.dspncdn.com/media/692x/1d/8e/26/1d8e2649f7bad15c400f298ab5a5b142.jpg", width: 353, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/b2/61/5a/b2615aea825783c026b5ebc137b8fde8.jpg", width: 380, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/08/46/6b/08466b7162f8550d468b861c3ade3898.jpg", width: 500, height: 402),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://67.media.tumblr.com/bee543222112a8cd2a7a52df92ef30e8/tumblr_npztqqXo321r1vfbso1_1280.jpg", width: 613, height: 852),
            Photo(url: "https://a1.dspncdn.com/media/692x/1d/8e/26/1d8e2649f7bad15c400f298ab5a5b142.jpg", width: 353, height: 530),
            Photo(url: "https://a1.dspncdn.com/media/692x/b2/61/5a/b2615aea825783c026b5ebc137b8fde8.jpg", width: 380, height: 530)
        ]
    }
}
