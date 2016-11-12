//
//  Person.swift
//  Athna
//
//  Created by WuGuihua on 11/11/16.
//  Copyright © 2016 Sherlock. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
