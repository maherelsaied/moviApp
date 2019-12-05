//
//  headerNib.swift
//  MoviApp
//
//  Created by Maher on 12/3/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher

//protocol reloade {
//    func setconstraine(con : CGFloat)
//}
class headerNib: UICollectionReusableView {

    @IBOutlet weak var orignallbl: UILabel!
    @IBOutlet weak var subLBL: UILabel!
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var textdetailes: UITextView!
    @IBOutlet weak var textconstrain: NSLayoutConstraint!
    @IBOutlet weak var recoconstrain: NSLayoutConstraint!
    
    

   //  var reloadeDelegate : reloade!
  
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.posterImage.layer.cornerRadius = 20
        self.posterImage.layer.borderColor = UIColor.gray.cgColor
        self.posterImage.layer.borderWidth = 2
        self.posterImage.clipsToBounds = true
    }
    
    
    /*
 reusableview.imageBack.kf.indicatorType = .activity
 let backimage = self.moviDetaiels!.backdrop_path
 if let url = URL(string: backimage){
 reusableview.imageBack.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
 }
 */
    
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
        let name = Notification.Name("reloade")
        NotificationCenter.default.post(name: name, object: nil)
    }
  //  collectionView(_:layout:referenceSizeForHeaderInSection:)

    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = false
        arg.sizeToFit()
        textdetailes.isScrollEnabled = false
        textconstrain.isActive = false
        
        print(self.frame.size.height)
        self.frame.size.height += textdetailes.bounds.size.height-150
        print(self.frame.size.height)
        recoconstrain.constant = 0
      
        
       
        
//         let hegit =  self.frame.size.height
//             let mainheight = hegit + textdetailes.frame.size.height-150
//         textconstrain?.constant = textdetailes.frame.size.height
//
//         reloadeDelegate?.setconstraine(con: mainheight)
//
       
  }
}





