//
//  DetaielsApi.swift
//  MoviApp
//
//  Created by Maher on 10/16/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class DetaielsApi: NSObject {
    class func getDetaiels (id : Int , completion:@escaping (_ Error:Error? , _ moviDet : moviDet?)->Void ){
        let api_key = "7c3f3cd662371816729b03e0e7fbfe6d"
        let url = "http://api.themoviedb.org/3/movie/\(id)"
        let parameters = ["api_key" : api_key]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                switch response.result {
                case .failure(let Error):
                   
                    completion(Error , nil)
                case .success(let value):
                   
                    let json = JSON(value)

                    
                    
                    if let datas = json.dictionary , let movi = moviDet(dict: datas) {
                        
                   
                        completion(nil , movi)
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
//
//
//                    let original_title :String = datas["original_title"]?.string ?? "maher"
//                    let tagline : String = datas["tagline"]?.string ?? "maher"
//                    let poster_path : String = datas["poster_path"]?.string ?? "maher"
//                    let backdrop_path : String = datas["backdrop_path"]?.string ?? "maher"
//                    let vote_average : Double = datas["vote_average"]?.double ?? 0.0
//                    let overview : String = datas["overview"]?.string ?? "maher"
//                    let release_date : String = datas["release_date"]?.string ?? "maher"
//
//                    let movi = moviDet(original_title: original_title, tagline: tagline, poster_path: poster_path, backdrop_path: backdrop_path, vote_average: vote_average, overview: overview, release_date: release_date)
//                    print(movi!.original_title)
//                    var moviD = [moviDet]()
//                    moviD.append(movi!)
//
                    
                    
//                    for data in datas {
//                        print("maher")
//                        if let dict = data.dictionary , let movi = moviDet(dict: dict){
//                            moviD.append(movi)
//                            print(moviD)
//                        }
//                    }
//                    completion(nil , moviD)
                    
                }
        }
    }
}
