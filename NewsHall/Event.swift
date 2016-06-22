//
//  Event.swift
//  NewsHall
//
//  Created by Ankit Kumar on 15/04/16.
//  Copyright (c) 2016 Ankit Kumar. All rights reserved.
//

import UIKit

class Event {
    // MARK: Properties
    
    var heading: String
    var photo: UIImage?
    
    // MARK: Initialization
    
    init(heading: String, photo: UIImage?) {
        // Initialize stored properties.
        self.heading = heading
        self.photo = photo
    }
}