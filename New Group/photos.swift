//
//  photos.swift
//  WebService
//
//  Created by Maher on 10/7/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import SwiftyJSON

class photos: NSObject {
    var id : Int
    var url : String
    
    init?(id:Int = 0 , url:String){
        self.id = id
        self.url = "http://elzohrytech.com/alamofire_demo/" + url
    }
    init?(dict:[String : JSON]){
        guard let id = dict["id"]?.toInt , let url = dict["poster_path"]?.PathString else {return nil}
        self.id = id
        self.url = url
    }
    
}
