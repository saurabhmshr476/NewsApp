//
//  StoryData.swift
//  NewsApp
//
//  Created by SAURABH MISHRA on 06/12/19.
//  Copyright © 2019 SAURABH MISHRA. All rights reserved.
//

import Foundation

struct StoryData:Decodable {
    let status:String
    let copyright:String
    let numResults:Int
    let results:[Story]
}


