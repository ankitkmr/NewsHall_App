//
//  Source.swift
//  NewsHall
//
//  Created by Ankit Kumar on 15/04/16.
//  Copyright (c) 2016 Ankit Kumar. All rights reserved.
//

import UIKit

class Source {
    // MARK: Properties
    
    var heading: String
    var photo: UIImage?
    var sourceName: String
    var rating1: String
    var rating2: String
//    var rating3: String
    
    // MARK: Initialization
    
    init(heading: String, photo: UIImage?, sourceName: String,rating1: String, rating2: String) {
        // Initialize stored properties.
        self.heading = heading
        self.photo = photo
        self.rating1 = rating1
        self.rating2 = rating2
//        self.rating3 = rating3
        self.sourceName = sourceName
    }
}
