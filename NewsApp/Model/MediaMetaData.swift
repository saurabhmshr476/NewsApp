//
//  MediaMetaData.swift
//  NewsApp
//
//  Created by SAURABH MISHRA on 06/12/19.
//  Copyright © 2019 SAURABH MISHRA. All rights reserved.
//

import Foundation

struct MediaMetaData:Decodable {
    let url:String
    let format:String
    let height:Int
    let width:Int
}
