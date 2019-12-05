//
//  headerNib.swift
//  MoviApp
//
//  Created by Maher on 12/3/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher

protocol reloadHeader {
    func setconstraine(conHeight : CGFloat)
}
class headerNib: UICollectionReusableView {

    @IBOutlet weak var orignallbl: UILabel!
    @IBOutlet weak var subLBL: UILabel!
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var textdetailes: UITextView!
    @IBOutlet weak var textconstrain: NSLayoutConstraint!
    @IBOutlet weak var recoconstrain: NSLayoutConstraint!
    
    

     var reloadeDelegate : reloadHeader!
  
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.posterImage.layer.cornerRadius = 20
        self.posterImage.layer.borderColor = UIColor.gray.cgColor
        self.posterImage.layer.borderWidth = 2
        self.posterImage.clipsToBounds = true
    }
    

    
    func getImageBack (image:String){
        self.imageBack.kf.indicatorType = .activity
        if let url = URL(string: image){
            self.imageBack.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
        }
        }
    
    
    func posterimageGet (image:String){
        self.posterImage.kf.indicatorType = .activity
        if let url = URL(string: image){
            self.posterImage.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
        }
    }

    @IBOutlet weak var readoutleat: UIButton!
    @IBAction func readmoreaction(_ sender: UIButton) {
        adjustUITextViewHeight(arg: self.textdetailes)
        self.readoutleat.isHidden = true
    }
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = false
        arg.sizeToFit()
        textdetailes.isScrollEnabled = false
        textconstrain.isActive = false
        
        let height = self.frame.size.height + textdetailes.bounds.size.height-150
        reloadeDelegate?.setconstraine(conHeight: height)
        recoconstrain.constant = 0
      
       
  }
}





