//
//  DataArray.swift
//  
//
//  Created by 孟若 on 15/9/21.
//
//

import UIKit

class DataArray: NSObject {
    var tempArray = [Rest]() //临时变量
    var dataArray:[Rest] {
        get {
            return tempArray
        }
    }
    
    override init(){
        let diaryList = NSBundle.mainBundle().pathForResource("userInfo", ofType:"plist")!
        let data = NSMutableDictionary(contentsOfFile:diaryList)
        let user = NSMutableArray(array: data?.objectForKey("users") as! Array )
        var list = Array<Rest>()
        for info in user {
            var name = "";var image = "";var location = "";var work = "";var phone = ""
            if let code = info["name"] as? String {
                let result = String(code)
                name = result
            }
            if let code = info["image"] as? String {
                let result = String(code)
                image = result
            }
            if let code = info["location"] as? String {
                let result = String(code)
                location = result
            }
            if let code = info["work"] as? String {
                let result = String(code)
                work = result
            }
            if let code = info["phone"] as? String {
                let result = String(code)
                phone = result
            }
            list.append(Rest.init(name: name, image: image, location: location, type: work, phone: phone,isVisit: true))
        }
        tempArray = list
    }
}
