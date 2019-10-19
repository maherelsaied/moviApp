//
//  moviCollectionCell.swift
//  MoviApp
//
//  Created by Maher on 10/14/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher
class moviCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageposter: UIImageView!
    
    var id :Int?
    
    
    var photo : photos?{
        didSet{
            guard let photo = photo else{return}
            //////////////KIngfisher/////////////
            self.id = photo.id
            // import kingfisher to install images
            self.imageposter.kf.indicatorType = .activity
            if let url = URL(string: photo.url) {
                self.imageposter.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
            }
            
        }
    }
}
