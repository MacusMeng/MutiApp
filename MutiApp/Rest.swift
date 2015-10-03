//
//  Rest.swift
//  
//
//  Created by 孟若 on 15/9/21.
//
//

import UIKit

class Rest: NSObject {
    var name: String = ""
    var image: String = ""
    var location: String = ""
    var type: String = ""
    var phone : String = ""
    var isVisit: Bool = false
    init(name: String,image: String,location: String,type: String,phone: String,isVisit: Bool){
        self.name = name
        self.image = image
        self.location = location
        self.type = type
        self.phone = phone
        self.isVisit = isVisit
    }
    
}
