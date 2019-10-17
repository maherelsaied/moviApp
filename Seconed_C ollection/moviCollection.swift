//
//  moviCollection.swift
//  AppStore
//
//  Created by Maher on 9/26/19.
//  Copyright © 2019 Maher. All rights reserved.
//

import UIKit


class moviCollection: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {


    @IBOutlet weak var collectionview: UICollectionView!

    var imageArr:[UIImage] = [
        UIImage(named: "image1")! ,
        UIImage(named: "image2")! ,
        UIImage(named: "image3")! ,
        UIImage(named: "image4")! ,
        UIImage(named: "image4")! ,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.dataSource = self
        collectionview.delegate = self

        let layout = self.collectionview.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionview.frame.size.width - 30 )/2, height: self.collectionview.frame.size.height/3)

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! moviCollectionCell
        
        cell.imageposter.image = imageArr[indexPath.row]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 2
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.layer.cornerRadius = 20
//        cell?.layer.borderColor = UIColor.darkGray.cgColor
//        cell?.layer.borderWidth = 5
//    }

//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.layer.cornerRadius = 20
//        cell?.layer.borderColor = UIColor.lightGray.cgColor
//        cell?.layer.borderWidth = 2
//    }

}
