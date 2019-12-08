//
//  CollectionViewCell.swift
//  MoviApp
//
//  Created by Maher on 12/5/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    var id :Int?
    var photoArr = [Photos]()
   
    var photo : Photos?{
        didSet{
            guard let photo = photo else{return}
            //////////////KIngfisher/////////////
            self.id = photo.id
            // import kingfisher to install images
            self.movieImage.kf.indicatorType = .activity
            if let url = URL(string: photo.url) {
                self.movieImage.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 20
      
    }
   
    
   
    
    

}
