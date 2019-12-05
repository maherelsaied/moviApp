//
//  headercollectionView.swift
//  MoviApp
//
//  Created by Maher on 12/3/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher
class headercollectionView: UIViewController {

    var height : CGFloat = 620.0
    var ismoreHeight : CGFloat = 0.0
    var ismorereading = false
    var translatedID : Int?
    var moviDetaiels : moviDet?
    var photoArr = [photos]()
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

          collectionview.register(UINib(nibName: "headerNib", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "head")
        
        
        DetaielsApi.getDetaiels(id: translatedID!) { (Error:Error?, moviDet : moviDet?) in
            if let movi = moviDet {
                self.moviDetaiels  = movi
            }
        }
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        if !ismorereading {
            let layout = self.collectionview.collectionViewLayout as! UICollectionViewFlowLayout
            
            print("hello")
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
            layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 40 )/2, height: (self.collectionview.frame.size.height+300)/5)
        }
        
        
        view.backgroundColor = .white
        collectionview.backgroundColor = .clear
        
        uploadata(index: 1)
        
       
    }

    override func viewWillAppear(_ animated: Bool) {
        
      
        
      
    }
 
   
    
    func uploadata(index : Int ){
        DispatchQueue.main.async { [weak self] in
            photoApi.getPhotos(index: 1) { (Error:Error?, photo:[photos]?, last_page: Int) in
                if let ph = photo {
                    self?.photoArr = ph
                    self?.collectionview.reloadData()
                    
                }
            }
        }
    }
 }

extension headercollectionView : UICollectionViewDelegate , UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "recoCell", for: indexPath) as! recommendCell
        cell.layer.cornerRadius = 20
        cell.photo = photoArr[indexPath.item]
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "head", for: indexPath) as! headerNib
          
          
            reusableview.orignallbl.text = moviDetaiels?.original_title
            reusableview.subLBL.text = moviDetaiels?.tagline
            reusableview.textdetailes.text = moviDetaiels?.overview
            if let urlback = moviDetaiels?.backdrop_path{
                reusableview.getImageBack(image: urlback)
            }
            if let urlPoster =  moviDetaiels?.poster_path{
                reusableview.posterimageGet(image: urlPoster)
            }
            reusableview.reloadeDelegate = self
            return reusableview
        default:  fatalError("Unexpected element kind")
        }
    
    
}
}

extension headercollectionView : UICollectionViewDelegateFlowLayout , reloadHeader {
    
    func setconstraine(conHeight: CGFloat) {
        ismorereading = true
        ismoreHeight = conHeight
         self.collectionview.collectionViewLayout.invalidateLayout()
        print(ismoreHeight)
        
    }
   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
   
        if ismorereading {
            let size = CGSize(width: collectionView.frame.size.width, height: ismoreHeight)
            print("new height is \(ismoreHeight)")
       
        return size
        }else {
            print("///////////////")
             return CGSize(width: collectionView.frame.size.width, height: height)
        }
     
    }
    
}

