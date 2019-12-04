//
//  JsonExtention.swift
//  WebService
//
//  Created by Maher on 10/4/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import Foundation
import SwiftyJSON
extension JSON {
    var ToBool : Bool?{
        if let bool = self.bool {return bool}
        if let int = self.toInt {
            if int == 0 {
                return false
            }else {
                return true
            }
        }
        return false
    }
    
    
    var toInt : Int? {
        if let int = self.int {return int}
        if let string = self.string , let int = Int(string){
            return int
        }
        return 0
    }
    

    
    
    var toDouble : Double? {
        if let double = self.double {return double}
        if let string = self.string , let double = Double(string){
            return double
        }
        return 0.0
    }
    
    var PathString : String? {
        guard let string = self.string , !string.isEmpty else{return nil}
        return "http://image.tmdb.org/t/p/w185/" + string
    }
 
}
extension UIImage {
    func imageWithColor(_ color: UIColor) -> UIImage? {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
