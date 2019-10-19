//
//  moviDet.swift
//  MoviApp
//
//  Created by Maher on 10/15/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import SwiftyJSON

class moviDet: NSObject {
    var id : Int
    var original_title :String
    var tagline : String
    var poster_path : String
    var backdrop_path : String
    var vote_average : Double
    var overview : String
    var release_date : String
    
    init?( original_title : String , tagline : String , poster_path : String , backdrop_path : String , vote_average : Double , overview : String , release_date : String , id :Int) {
        self.id = id
        self.backdrop_path = backdrop_path
        self.original_title = original_title
        self.overview = overview
        self.poster_path = poster_path
        self.release_date = release_date
        self.tagline = tagline
        self.vote_average = vote_average
        
    }
    
    
    init?(dict:[String : JSON]){
        guard let tagline = dict["tagline"]?.string,
            let id = dict["id"]?.int,
            let poster_path = dict["poster_path"]?.PathString ,
            let original_title = dict["original_title"]?.string,
            let backdrop_path = dict["backdrop_path"]?.PathString  ,
            let vote_average = dict["vote_average"]?.double ,
            let overview = dict["overview"]?.string,
            let release_date = dict["release_date"]?.string
            else {return nil}
        self.id = id
        self.tagline = tagline
        self.poster_path = poster_path
        self.backdrop_path = backdrop_path
        self.original_title = original_title
        self.overview = overview
        self.vote_average = vote_average
        self.release_date = release_date
        
    }

}
