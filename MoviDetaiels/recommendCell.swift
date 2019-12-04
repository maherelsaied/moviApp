//
//  recommendCell.swift
//  MoviApp
//
//  Created by Maher on 10/17/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher
class recommendCell: UICollectionViewCell {
   
    @IBOutlet weak var imagecoll: UIImageView!
    
    var photo : photos?{
        didSet{
            guard let photo = photo else{return}
            //////////////KIngfisher/////////////
            
            // import kingfisher to install images
            self.imagecoll.kf.indicatorType = .activity
            if let url = URL(string: photo.url) {
                self.imagecoll.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
            }
            
        }
    }
}
