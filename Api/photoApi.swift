//
//  photoApi.swift
//  MoviApp
//
//  Created by Maher on 10/14/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class photoApi: NSObject {

    class func getPhotos(index : Int , page : Int=1, completion:@escaping (_ Error:Error? ,_ photo : [photos]? , _ last_page : Int )->Void){
        var url : String?
        if index == 0 {
            url =  "http://api.themoviedb.org/3/movie/top_rated"
        } else if index == 1 {
            url = "http://api.themoviedb.org/3/movie/popular"
        } else if index == 2 {
            url =  "http://api.themoviedb.org/3/movie/upcoming"
        } else if index == 3 {
            url =  "http://api.themoviedb.org/3/movie/now_playing"
        }
        
        let api_key = "7c3f3cd662371816729b03e0e7fbfe6d"
        
        let parameters : [String : Any] = ["api_key" :api_key , "page" : page ]
        guard let Url = url else {return}
        Alamofire.request(Url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                switch response.result
                {
                case .failure(let error):
                    completion(error , nil , page)
                   
                case .success(let value):
                    let json = JSON(value)
                    guard let datas = json["results"].array else{
                        completion(nil , nil , page)
                        return
                    }
                    var photoArray = [photos]()
                    for data in datas {
                        if let dict = data.dictionary , let photo = photos(dict: dict){
                            photoArray.append(photo)
                           
                        }
                    }
                    let lastpage = json["page"].toInt ?? page
                    
                    completion(nil , photoArray , lastpage )
                    
                }
        }
    }
    
    
    
//    class func getPhotos_popular(page : Int=1, completion:@escaping (_ Error:Error? ,_ photo : [photos]? , _ last_page : Int )->Void){
//        let api_key = "7c3f3cd662371816729b03e0e7fbfe6d"
//        let url =  "http://api.themoviedb.org/3/movie/popular"
//       let parameters : [String : Any] = ["api_key" :api_key , "page" : page ]
//        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
//            .responseJSON { (response) in
//                switch response.result
//                {
//                case .failure(let error):
//                    completion(error , nil , page)
//                    print("you have erroe 1 ")
//                case .success(let value):
//                    let json = JSON(value)
//                    guard let datas = json["results"].array else{
//                        completion(nil , nil , page)
//                        return
//                    }
//                    var photoArray = [photos]()
//                    for data in datas {
//                        if let dict = data.dictionary , let photo = photos(dict: dict){
//                            photoArray.append(photo)
//                        }
//                    }
//                    let lastpage = json["page"].toInt ?? page
//
//                    completion(nil , photoArray , lastpage )
//
//                }
//        }
//    }
//
//
//
//    class func getPhotos_upcoming(page : Int=1, completion:@escaping (_ Error:Error? ,_ photo : [photos]? , _ last_page : Int )->Void){
//        let api_key = "7c3f3cd662371816729b03e0e7fbfe6d"
//        let url =  "http://api.themoviedb.org/3/movie/upcoming"
//        let parameters : [String : Any] = ["api_key" :api_key , "page" : page ]
//        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
//            .responseJSON { (response) in
//                switch response.result
//                {
//                case .failure(let error):
//                    completion(error , nil , page)
//                    print("you have erroe 1 ")
//                case .success(let value):
//                    let json = JSON(value)
//                    guard let datas = json["results"].array else{
//                        completion(nil , nil , page)
//                        return
//                    }
//                    var photoArray = [photos]()
//                    for data in datas {
//                        if let dict = data.dictionary , let photo = photos(dict: dict){
//                            photoArray.append(photo)
//                        }
//                    }
//                    let lastpage = json["page"].toInt ?? page
//
//                    completion(nil , photoArray , lastpage )
//
//                }
//        }
//    }
//
//
//
//    class func getPhotos_now_playing(page : Int=1, completion:@escaping (_ Error:Error? ,_ photo : [photos]? , _ last_page : Int )->Void){
//        let api_key = "7c3f3cd662371816729b03e0e7fbfe6d"
//        let url =  "http://api.themoviedb.org/3/movie/now_playing"
//        let parameters : [String : Any] = ["api_key" :api_key , "page" : page ]
//        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
//            .responseJSON { (response) in
//                switch response.result
//                {
//                case .failure(let error):
//                    completion(error , nil , page)
//                    print("you have erroe 1 ")
//                case .success(let value):
//                    let json = JSON(value)
//                    guard let datas = json["results"].array else{
//                        completion(nil , nil , page)
//                        return
//                    }
//                    var photoArray = [photos]()
//                    for data in datas {
//                        if let dict = data.dictionary , let photo = photos(dict: dict){
//                            photoArray.append(photo)
//                        }
//                    }
//                    let lastpage = json["page"].toInt ?? page
//
//                    completion(nil , photoArray , lastpage )
//
//                }
//        }
//    }
}
