//
//  Story.swift
//  NewsApp
//
//  Created by SAURABH MISHRA on 06/12/19.
//  Copyright © 2019 SAURABH MISHRA. All rights reserved.
//

import Foundation

struct Story:Decodable {
    let byline:String
    let title:String
    let abstract:String
    let publishedDate:String
    let media:[MediaData]
}

