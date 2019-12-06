//
//  MediaData.swift
//  NewsApp
//
//  Created by SAURABH MISHRA on 06/12/19.
//  Copyright © 2019 SAURABH MISHRA. All rights reserved.
//

import Foundation

struct MediaData:Decodable {
    let mediaMetaData:[MediaMetaData]
    enum CodingKeys: String, CodingKey {
         case mediaMetaData = "media-metadata"
    }
}

