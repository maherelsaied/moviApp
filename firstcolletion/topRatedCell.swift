//
//  topRatedCell.swift
//  MoviApp
//
//  Created by Maher on 12/4/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher

class topRatedCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView! {
        didSet{
            self.layer.cornerRadius = 20
            self.layer.borderColor = UIColor.white.cgColor
        }
    }
    var id :Int?
    var photo : photos?{
        didSet{
            guard let photo = photo else{return}
            //////////////KIngfisher/////////////
            self.id = photo.id
            // import kingfisher to install images
            self.image?.kf.indicatorType = .activity
            if let url = URL(string: photo.url) {
                self.image?.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
             
            }
        }
    }
}
