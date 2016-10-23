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

extension Photo: Equatable {
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return
            lhs.url == rhs.url
    }
}

extension Photo {
    static func all() -> [Photo] {
        return [
            Photo(url: "http://thisiscolossal.com/wp-content/uploads/2011/02/force-1-600x336.jpg", width: 600, height: 336),
            Photo(url: "https://67.media.tumblr.com/86c502cb18d3a51dcdf885f8e179169e/tumblr_o5qhgbD8Pp1qliixbo1_r2_500.gif", width: 500, height: 281),
            Photo(url: "https://40.media.tumblr.com/tumblr_m56qvzV24S1qm91owo7_r1_1280.jpg", width: 917, height: 1375),
            Photo(url: "https://41.media.tumblr.com/8fc3100f5778acdfb651f34bc7b8e575/tumblr_myyj2eAJk91t7b5qro4_1280.jpg", width: 945, height: 945),
            Photo(url: "https://66.media.tumblr.com/b5a0e4819742b56307a77f376f8c1c8b/tumblr_o0ui7kgNno1qbwnuho2_1280.jpg", width: 1280, height: 553),
            Photo(url: "https://66.media.tumblr.com/740efe3e44303ceb5d8c7502dc5f1071/tumblr_o0v0j4qqeK1sndzdgo1_1280.png", width: 1280, height: 623),
            Photo(url: "https://66.media.tumblr.com/b4f2ffad5330697e7658f9bff7fa725a/tumblr_n2jgg6qM5h1qghl49o1_500.gif", width: 500, height: 210),
            Photo(url: "https://66.media.tumblr.com/39712501a5cb0ddc1c49e70215f55a93/tumblr_o2xyh332bs1qliixbo1_1280.jpg", width: 1000, height: 767),
            Photo(url: "https://65.media.tumblr.com/fa877c2ada6f41f32715892ac88f403e/tumblr_o63x0bQC7d1qliixbo1_1280.jpg", width: 1089, height: 1280),
            Photo(url: "https://67.media.tumblr.com/ac2620c8fc08400293065dfc10b9f962/tumblr_o56fitceLA1qghl49o1_r1_540.gif", width: 540, height: 229),
            Photo(url: "https://67.media.tumblr.com/c3d221c40a255aed6fc64e2125d38709/tumblr_nrnxh3N53k1qztcdbo1_1280.jpg", width: 1280, height: 1280),
            Photo(url: "https://41.media.tumblr.com/40f973a28342db5d30cbeea579e54fb9/tumblr_ni0h27SzmO1qliixbo1_1280.jpg", width: 1280, height: 853),
            Photo(url: "https://66.media.tumblr.com/d7550604feca5ac77d6a69738c8f6de0/tumblr_nrnxh3N53k1qztcdbo2_1280.jpg", width: 1280, height: 1280),
            Photo(url: "https://66.media.tumblr.com/tumblr_m56qvzV24S1qm91owo2_1280.jpg", width: 917, height: 1375),
            Photo(url: "https://41.media.tumblr.com/tumblr_m56qvzV24S1qm91owo1_1280.jpg", width: 917, height: 1375),
            Photo(url: "https://41.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://40.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_myyj2eAJk91t7b5qro6_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://41.media.tumblr.com/tumblr_m56qvzV24S1qm91owo3_1280.jpg", width: 917, height: 1375),
            Photo(url: "https://41.media.tumblr.com/c3d221c40a255aed6fc64e2125d38709/tumblr_nrnxh3N53k1qztcdbo1_1280.jpg", width: 1280, height: 1280),
            Photo(url: "https://45.media.tumblr.com/ac2620c8fc08400293065dfc10b9f962/tumblr_o56fitceLA1qghl49o1_r1_540.gif", width: 540, height: 229),
            Photo(url: "https://40.media.tumblr.com/f4b99583c77dcc91471bebfedcb9af98/tumblr_nnolvbDaK91teto02o2_1280.jpg", width: 1024, height: 435),
            Photo(url: "https://41.media.tumblr.com/30899685e9422c33b056aece28f21626/tumblr_nrnxh3N53k1qztcdbo3_1280.jpg", width: 1280, height: 1280),
            Photo(url: "https://36.media.tumblr.com/fa877c2ada6f41f32715892ac88f403e/tumblr_o63x0bQC7d1qliixbo1_1280.jpg", width: 1089, height: 1280),
            Photo(url: "https://41.media.tumblr.com/fa5accb9d810f0f57a69102f8749e9e5/tumblr_nhonw0yzgP1qd479ro1_1280.jpg", width: 1280, height: 720),
            Photo(url: "https://49.media.tumblr.com/6f0801eb012dbf1fe5f075f1e37f466c/tumblr_o4iefnhfIM1qghl49o1_540.gif", width: 540, height: 237),
            Photo(url: "https://66.media.tumblr.com/c77ada8dff7b44d216db0c561c5520db/tumblr_o587nfWdGQ1qghl49o1_540.gif", width: 540, height: 223),
            Photo(url: "https://40.media.tumblr.com/740efe3e44303ceb5d8c7502dc5f1071/tumblr_o0v0j4qqeK1sndzdgo1_1280.png", width: 1280, height: 623),
            Photo(url: "http://www.thisiscolossal.com/wp-content/uploads/2011/11/6370525799_cbcc60acd6_b-600x848.jpg", width: 600, height: 848),
            Photo(url: "https://41.media.tumblr.com/ecc774a8308a5659ff71d6217431a9e8/tumblr_myyj2eAJk91t7b5qro2_1280.jpg", width: 945, height: 945),
            Photo(url: "https://66.media.tumblr.com/bc47065800037a026fbd2f59c25b2ee7/tumblr_nnolvbDaK91teto02o3_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://66.media.tumblr.com/f4b99583c77dcc91471bebfedcb9af98/tumblr_nnolvbDaK91teto02o2_1280.jpg", width: 1024, height: 435),
            Photo(url: "https://38.media.tumblr.com/b4f2ffad5330697e7658f9bff7fa725a/tumblr_n2jgg6qM5h1qghl49o1_500.gif", width: 500, height: 210),
            Photo(url: "https://40.media.tumblr.com/1100cb11957088bc04ffea9a18b496d3/tumblr_niyej3cBTG1tqyfuro1_1280.jpg", width: 736, height: 1071),
            Photo(url: "https://49.media.tumblr.com/24a9c740336d3c5408d7d55aa78cf7f9/tumblr_o5qksxmJvB1qliixbo1_500.gif", width: 500, height: 281),
            Photo(url: "https://36.media.tumblr.com/af7355c71c5983de22c6854816a04d3f/tumblr_n76rz9eXHI1rey8wlo1_1280.jpg", width: 1200, height: 929),
            Photo(url: "https://66.media.tumblr.com/6f0801eb012dbf1fe5f075f1e37f466c/tumblr_o4iefnhfIM1qghl49o1_540.gif", width: 540, height: 237),
            Photo(url: "https://40.media.tumblr.com/39712501a5cb0ddc1c49e70215f55a93/tumblr_o2xyh332bs1qliixbo1_1280.jpg", width: 1000, height: 767),
            Photo(url: "https://40.media.tumblr.com/20666337d78c4faf463cd6939a669d3e/tumblr_myyj2eAJk91t7b5qro1_1280.jpg", width: 945, height: 945),
            Photo(url: "https://67.media.tumblr.com/tumblr_m56qvzV24S1qm91owo3_1280.jpg", width: 917, height: 1375),
            Photo(url: "https://67.media.tumblr.com/c2d8f3f04223855128f4966ee008f8e7/tumblr_nnolvbDaK91teto02o4_1280.jpg", width: 1024, height: 684),
            Photo(url: "https://41.media.tumblr.com/ef14c16d4a4342d6968c1abfe81d40fc/tumblr_nnolvbDaK91teto02o1_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://45.media.tumblr.com/86c502cb18d3a51dcdf885f8e179169e/tumblr_o5qhgbD8Pp1qliixbo1_r2_500.gif", width: 500, height: 281),
            Photo(url: "https://66.media.tumblr.com/tumblr_m56qvzV24S1qm91owo7_r1_1280.jpg", width: 917, height: 1375),
            Photo(url: "https://40.media.tumblr.com/b8e43f47d8e66170b8a6e10d663e56bb/tumblr_myyj2eAJk91t7b5qro3_1280.jpg", width: 945, height: 945),
            Photo(url: "https://67.media.tumblr.com/30899685e9422c33b056aece28f21626/tumblr_nrnxh3N53k1qztcdbo3_1280.jpg", width: 1280, height: 1280),
            Photo(url: "https://49.media.tumblr.com/c77ada8dff7b44d216db0c561c5520db/tumblr_o587nfWdGQ1qghl49o1_540.gif", width: 540, height: 223),
            Photo(url: "https://40.media.tumblr.com/19409ef37b04928b4c2a3f345a6c61e9/tumblr_myyj2eAJk91t7b5qro5_1280.jpg", width: 945, height: 945),
            Photo(url: "https://36.media.tumblr.com/tumblr_m56qvzV24S1qm91owo4_1280.jpg", width: 917, height: 1375),
            Photo(url: "https://67.media.tumblr.com/ef14c16d4a4342d6968c1abfe81d40fc/tumblr_nnolvbDaK91teto02o1_1280.jpg", width: 1024, height: 683),
            Photo(url: "https://66.media.tumblr.com/24a9c740336d3c5408d7d55aa78cf7f9/tumblr_o5qksxmJvB1qliixbo1_500.gif", width: 500, height: 281)
        ]
    }
}
