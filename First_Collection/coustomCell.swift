//
//  coustomCell.swift
//  AppStore
//
//  Created by Maher on 9/23/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit
import Kingfisher
import FittedSheets
class catogeryCell : UICollectionViewCell {
     var photoArr = [photos]()
     var ids = [Int]()
    
    let AppcellID = "AppCellId"
     let AppCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    let deviderline : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.2, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let namelabel : UILabel = {
        let Nlabel = UILabel()
        //Nlabel.text = "Best New App"
        Nlabel.translatesAutoresizingMaskIntoConstraints = false
        Nlabel.font = UIFont.systemFont(ofSize: 20)
        return Nlabel
    }()
    let showlabel : UILabel = {
        let show = UILabel()
        show.text = "Show All"
        show.translatesAutoresizingMaskIntoConstraints = false
        show.font = UIFont.systemFont(ofSize: 20)
        show.textColor = .blue
        
        return show
    }()
    
 
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews (){
        addSubview(AppCollectionView)
        AppCollectionView.delegate = self
        AppCollectionView.dataSource = self
        addSubview(deviderline)
        addSubview(namelabel)
        addSubview(showlabel)
        
        AppCollectionView.register(appcollectionCell.self, forCellWithReuseIdentifier: AppcellID)
        //uploadtasks(index: 1)
    
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-250-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":showlabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":namelabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":deviderline]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":AppCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[namelabel(20)][v0][v1(1)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":AppCollectionView, "v1":deviderline , "namelabel":namelabel ]))

    }
    
     func uploadtasks(index : Int){
        photoApi.getPhotos(index: index) { (Error:Error?, photo:[photos]?, last_page : Int) in
            if let ph = photo {
              self.photoArr = ph
              self.AppCollectionView.reloadData()
        }
        }
    }
   

    }
extension catogeryCell :  UICollectionViewDelegateFlowLayout , UICollectionViewDelegate,UICollectionViewDataSource  {
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: frame.height-40 )
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArr.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AppCollectionView.dequeueReusableCell(withReuseIdentifier: AppcellID , for: indexPath) as! appcollectionCell
       // uploadtasks(index: indexPath.row)
        cell.photo = photoArr[indexPath.row]
        self.ids.append(cell.id!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
      //  guard let window = UIApplication.shared.keyWindow else{return}
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
       
         let vc = sb.instantiateViewController(withIdentifier: "thierd") as! moviDetails
         vc.translatedID = self.ids[indexPath.row]
         print(self.ids[indexPath.row])
         let sheetController = SheetViewController(controller: vc)
        self.window?.rootViewController?.present(sheetController , animated:false , completion: nil)
        
        
        
        
        
  
        
    }
  
}
//////////////////////

class appcollectionCell : UICollectionViewCell {
    let imageview : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
        
    }()
    var id :Int?
    var photo : photos?{
        didSet{
            guard let photo = photo else{return}
            //////////////KIngfisher/////////////
            self.id = photo.id
            // import kingfisher to install images
            self.imageview.kf.indicatorType = .activity
            if let url = URL(string: photo.url) {
                self.imageview.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))])
            }
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .white
        addSubview(imageview)
        imageview.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width+50)
        
    }
}
