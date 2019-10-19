//
//  moviDetails.swift
//  MoviApp
//
//  Created by Maher on 10/15/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher

class moviDetails: UIViewController {
    @IBOutlet weak var collectionRecommend: UICollectionView!
    var translatedID : Int?
    var moviDetaiels = [moviDet]()
    var photoArr = [photos]()
    
    @IBOutlet weak var scrool: UIScrollView!
    @IBOutlet weak var hidinbtn: UIButton!
    
    @IBOutlet weak var dateicon: UIImageView!
    @IBOutlet weak var shareicon: UIImageView!
    @IBOutlet weak var watchicon: UIImageView!
    @IBOutlet weak var timeicon: UIImageView!
    @IBOutlet weak var rateicon: UIImageView!
    @IBOutlet weak var maintitle: UILabel!
    @IBOutlet weak var sub_title: UILabel!
    @IBOutlet weak var ratelbl: UILabel!
    @IBOutlet weak var loveimage: UIImageView!
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var overViewtxt: UITextView!
    
    @IBOutlet weak var heightconstrain: NSLayoutConstraint!
    @IBOutlet weak var textconstrain: NSLayoutConstraint!
    
    
    
    //share btn
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(Sharebtn))
        // self.uploadtasks(index: 1)
        
        
        self.posterImage.layer.cornerRadius = 20
        self.posterImage.layer.borderColor = UIColor.gray.cgColor
        self.posterImage.layer.borderWidth = 2
        scrool.isScrollEnabled = true
        scrool.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 2000)
        loveimage.image = loveimage.image?.imageWithColor(.gray)
        dateicon.image = dateicon.image?.imageWithColor(.gray)
        shareicon.image = shareicon.image?.imageWithColor(.gray)
        watchicon.image = watchicon.image?.imageWithColor(.gray)
        timeicon.image = timeicon.image?.imageWithColor(.gray)
        rateicon.image = rateicon.image?.imageWithColor(.gray)
        
        collectionRecommend.dataSource = self
        collectionRecommend.delegate = self
        
        let layout = self.collectionRecommend.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 10, right: 0)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionRecommend.frame.size.width - 20 )/2, height: (self.collectionRecommend.frame.size.height-45)/5)
        
        
        view.backgroundColor = .white
        collectionRecommend.backgroundColor = .clear
        collectionRecommend.alwaysBounceVertical = true
        
        DetaielsApi.getDetaiels(id: translatedID!) { (Error:Error?, moviDet : [moviDet]?) in
            if let movi = moviDet {
                self.moviDetaiels.append(contentsOf: movi)
                
                self.maintitle.text = self.moviDetaiels.first?.original_title
                self.sub_title.text =  self.moviDetaiels.first?.tagline
                self.overViewtxt.text = self.moviDetaiels.first?.overview
                let rate = self.moviDetaiels.first?.vote_average
                self.timelbl.text = "180"
                self.ratelbl.text = String(rate!)
                self.datelbl.text = self.moviDetaiels.first?.release_date
                self.backImage.kf.indicatorType = .activity
                let backimage1 = self.moviDetaiels.first?.backdrop_path
                if let url = URL(string: backimage1!){
                    self.backImage.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
                }
                
                
                self.posterImage.kf.indicatorType = .activity
                let posterimag1 = self.moviDetaiels.first?.poster_path
                if let url = URL(string: posterimag1!){
                    self.posterImage.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
                }
                
                
            }
            
            
        }
        
        uploadata(index: 1)
    }
    func uploadata(index : Int ){
        DispatchQueue.main.async { [weak self] in
            photoApi.getPhotos(index: 1) { (Error:Error?, photo:[photos]?, last_page: Int) in
                if let ph = photo {
                    self?.photoArr = ph
                    self?.collectionRecommend.reloadData()
                   
                }
            }
        }
    }
    // share data
    var Activitycontroller : UIActivityViewController!
    
    @objc func Sharebtn() {
        let imageToShare : UIImage = self.posterImage.image!
        let titleToShare : String =  self.overViewtxt.text!
        Activitycontroller = UIActivityViewController(activityItems: [imageToShare , titleToShare], applicationActivities: nil)
        Activitycontroller.excludedActivityTypes = [UIActivity.ActivityType.print ,
             UIActivity.ActivityType.postToWeibo,
             UIActivity.ActivityType.copyToPasteboard,
             UIActivity.ActivityType.addToReadingList,
             UIActivity.ActivityType.postToVimeo,
             UIActivity.ActivityType.airDrop]
             self.present(Activitycontroller ,animated: true , completion: nil)
        
        
    }
    
    
    
    
    @IBAction func readmore(_ sender: UIButton) {
        adjustUITextViewHeight(arg: self.overViewtxt)
        //viewtext()
        self.hidinbtn.isHidden = true
    }
    
    
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = false
        arg.sizeToFit()
        arg.isScrollEnabled = false
        textconstrain.isActive = false
    }
    
}
extension moviDetails : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionRecommend.dequeueReusableCell(withReuseIdentifier: "recoCell", for: indexPath) as! recommendCell
        cell.layer.cornerRadius = 20
        cell.photo = photoArr[indexPath.item]
        return cell
    }
}
